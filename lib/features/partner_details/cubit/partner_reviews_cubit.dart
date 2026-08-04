// lib/features/partner_details/cubit/partner_reviews_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/features/partner_details/data/models/partner_details_model.dart';
import 'package:dawri/features/partner_details/data/repositories/interfaces/i_partner_details_repository.dart';
import 'package:dawri/main_common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'partner_reviews_state.dart';
part 'partner_reviews_cubit.freezed.dart';

class PartnerReviewsCubit extends Cubit<PartnerReviewsState> {
  PartnerReviewsCubit(this.partnerId)
      : _repository = getIt<IPartnerDetailsRepository>(),
        super(const PartnerReviewsState());

  final int partnerId;
  final IPartnerDetailsRepository _repository;
  final RefreshController refreshController = RefreshController();

  static const int _limit = 10;

  Future<void> getReviews() async {
    emit(state.copyWith(status: const PartnerReviewsStatus.loading()));

    final result = await _repository.getReviews(
      partnerId: partnerId,
      page: 1,
      limit: _limit,
    );

    if (result.isError) {
      emit(state.copyWith(status: const PartnerReviewsStatus.error()));
      refreshController.refreshFailed();
      return;
    }

    final page = result.asValue!.value;
    emit(state.copyWith(
      status: const PartnerReviewsStatus.success(),
      reviews: page.items,
      rating: page.rating,
      page: 1,
    ));
    refreshController.refreshCompleted();
    refreshController.resetNoData();
  }

  Future<void> loadMoreReviews() async {
    if (state.reviews.length < _limit) {
      refreshController.loadNoData();
      return;
    }

    final nextPage = state.page + 1;
    final result = await _repository.getReviews(
      partnerId: partnerId,
      page: nextPage,
      limit: _limit,
    );

    if (result.isError) {
      refreshController.loadFailed();
      return;
    }

    final newItems = result.asValue!.value.items;
    if (newItems.isEmpty) {
      refreshController.loadNoData();
      return;
    }

    emit(state.copyWith(
      reviews: [...state.reviews, ...newItems],
      page: nextPage,
    ));

    newItems.length < _limit
        ? refreshController.loadNoData()
        : refreshController.loadComplete();
  }

  @override
  Future<void> close() {
    refreshController.dispose();
    return super.close();
  }
}
