import 'package:bloc/bloc.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/features/stadium_profile/data/models/stadium_profile_model.dart';
import 'package:dawri/features/stadium_profile/data/repositories/interfaces/i_stadium_profile_repository.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dawri/main_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'stadium_profile_state.dart';
part 'stadium_profile_cubit.freezed.dart';

class StadiumProfileCubit extends Cubit<StadiumProfileState> {
  StadiumProfileCubit(this.stadiumId)
      : _repository = getIt<IStadiumProfileRepository>(),
        super(const StadiumProfileState());

  final int stadiumId;
  final IStadiumProfileRepository _repository;
  final RefreshController reviewsRefreshController = RefreshController();

  // ─── Gallery ────────────────────────────────────────────────────────────
  void setActiveImage(int index) => emit(state.copyWith(activeImageIndex: index));

  // ─── Load Details ───────────────────────────────────────────────────────
  Future<void> loadStadiumDetails({double? lat, double? long}) async {
    emit(state.copyWith(detailsStatus: const StadiumProfileStatus.loading()));

    final result = await _repository.getStadiumDetails(
      stadiumId: stadiumId,
      lat: lat,
      long: long,
    );

    if (result.isError) {
      emit(state.copyWith(detailsStatus: const StadiumProfileStatus.error()));
      return;
    }

    final stadium = result.asValue!.value;
    emit(state.copyWith(
      detailsStatus: const StadiumProfileStatus.success(),
      stadium: stadium,
      isFavorite: stadium.isFav ?? false,
      reviews: stadium.reviews?.items ?? [],
    ));
  }

  // ─── Toggle Favorite (Optimistic) ────────────────────────────────────────
  Future<void> toggleFavorite() async {
    final previous = state.isFavorite;
    emit(state.copyWith(isFavorite: !previous));

    final result = await _repository.toggleWishlist(id: stadiumId);

    if (result.isError) {
      emit(state.copyWith(isFavorite: previous));
      MessageService.showToast(msg: 'Failed to update favorite', state: ToastStates.error);
      return;
    }

    MessageService.showToast(
      msg: result.asValue?.value ?? '',
      state: ToastStates.success,
    );
  }

  // ─── Reviews (Bottom Sheet) ───────────────────────────────────────────────
  Future<void> loadReviews() async {
    emit(state.copyWith(
      reviewsStatus: const StadiumProfileStatus.loading(),
      reviewsPage: 1,
    ));

    final result = await _repository.getReviews(stadiumId: stadiumId, page: 1);

    if (result.isError) {
      emit(state.copyWith(reviewsStatus: const StadiumProfileStatus.error()));
      reviewsRefreshController.refreshFailed();
      return;
    }

    final list = result.asValue!.value;
    emit(state.copyWith(
      reviewsStatus: const StadiumProfileStatus.success(),
      reviews: list,
      reviewsPage: 1,
      hasMoreReviews: list.length >= 20,
    ));
    reviewsRefreshController.refreshCompleted();
  }

  Future<void> loadMoreReviews() async {
    if (!state.hasMoreReviews) {
      reviewsRefreshController.loadNoData();
      return;
    }

    final nextPage = state.reviewsPage + 1;
    final result = await _repository.getReviews(stadiumId: stadiumId, page: nextPage);

    if (result.isError) {
      reviewsRefreshController.loadFailed();
      return;
    }

    final list = result.asValue!.value;
    emit(state.copyWith(
      reviews: [...state.reviews, ...list],
      reviewsPage: nextPage,
      hasMoreReviews: list.isNotEmpty,
    ));

    if (list.isNotEmpty) {
      reviewsRefreshController.loadComplete();
    } else {
      reviewsRefreshController.loadNoData();
    }
  }

  // ─── Rate Stadium ─────────────────────────────────────────────────────────
  void selectStars(int stars) => emit(state.copyWith(selectedStars: stars));
  void updateComment(String value) => emit(state.copyWith(comment: value));

  Future<void> submitRating() async {
    if (state.selectedStars == 0) {
      MessageService.showToast(
        msg: LocaleKeys.pleaseSelectRating.tr(),
        state: ToastStates.error,
      );
      return;
    }

    if (state.comment.trim().isEmpty) {
      MessageService.showToast(
        msg: LocaleKeys.pleaseWriteComment.tr(),
        state: ToastStates.error,
      );
      return;
    }

    emit(
      state.copyWith(
        rateSubmitStatus: const StadiumProfileStatus.loading(),
      ),
    );

    final result = await _repository.rateStadium(
      stadiumId: stadiumId,
      stars: state.selectedStars,
      comment: state.comment.trim(),
    );

    if (result.isError) {
      emit(
        state.copyWith(
          rateSubmitStatus: const StadiumProfileStatus.error(),
        ),
      );

      MessageService.showToast(
        msg: LocaleKeys.failedToSubmitRating.tr(),
        state: ToastStates.error,
      );
      return;
    }

    emit(
      state.copyWith(
        rateSubmitStatus: const StadiumProfileStatus.success(),
        selectedStars: 0,
        comment: '',
      ),
    );

    MessageService.showToast(
      msg: result.asValue?.value ?? '',
      state: ToastStates.success,
    );

    // Refresh stadium details
    await loadStadiumDetails();
  }
  void resetRateSubmitStatus() =>
      emit(state.copyWith(rateSubmitStatus: const StadiumProfileStatus.initial()));

  @override
  Future<void> close() {
    reviewsRefreshController.dispose();
    return super.close();
  }
}