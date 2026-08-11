// lib/features/partner_details/cubit/partner_videos_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/features/partner_details/data/models/partner_details_model.dart';
import 'package:dawri/features/partner_details/data/repositories/interfaces/i_partner_details_repository.dart';
import 'package:dawri/features/update_profile/data/repositories/interfaces/i_update_profile_repository.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dawri/main_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'partner_videos_state.dart';
part 'partner_videos_cubit.freezed.dart';

class PartnerVideosCubit extends Cubit<PartnerVideosState> {
  PartnerVideosCubit(this.partnerId)
      : _repository = getIt<IPartnerDetailsRepository>(),
        super(const PartnerVideosState());

  final int partnerId;
  final IPartnerDetailsRepository _repository;
  final RefreshController refreshController = RefreshController();

  static const int _limit = 10;

  Future<void> getVideos() async {
    emit(state.copyWith(status: const PartnerVideosStatus.loading()));

    final result = await _repository.getVideos(
      partnerId: partnerId,
      page: 1,
      limit: _limit,
    );

    if (result.isError) {
      emit(state.copyWith(status: const PartnerVideosStatus.error()));
      refreshController.refreshFailed();
      return;
    }

    emit(state.copyWith(
      status: const PartnerVideosStatus.success(),
      videos: result.asValue!.value,
      page: 1,
    ));
    refreshController.refreshCompleted();
    refreshController.resetNoData();
  }

  Future<void> loadMoreVideos() async {
    if (state.videos.length < _limit) {
      refreshController.loadNoData();
      return;
    }

    final nextPage = state.page + 1;
    final result = await _repository.getVideos(
      partnerId: partnerId,
      page: nextPage,
      limit: _limit,
    );

    if (result.isError) {
      refreshController.loadFailed();
      return;
    }

    final newItems = result.asValue!.value;
    if (newItems.isEmpty) {
      refreshController.loadNoData();
      return;
    }

    emit(state.copyWith(
      videos: [...state.videos, ...newItems],
      page: nextPage,
    ));

    newItems.length < _limit
        ? refreshController.loadNoData()
        : refreshController.loadComplete();
  }

  /// Reflects a view the server already accepted.
  void bumpViews(int videoId) {
    if (isClosed) return;
    emit(state.copyWith(
      videos: state.videos
          .map((v) => v.id == videoId ? v.withExtraView() : v)
          .toList(),
    ));
  }

  /// Only reachable when the screen was opened in own-profile mode. Deletion
  /// lives on the update-profile repository so the endpoint has one owner.
  Future<void> deleteVideo(int videoId) async {
    if (state.deletingIds.contains(videoId)) return;

    emit(state.copyWith(deletingIds: {...state.deletingIds, videoId}));

    final result =
        await getIt<IUpdateProfileRepository>().deleteVideo(videoId: videoId);
    final pending = {...state.deletingIds}..remove(videoId);

    if (result.isError) {
      emit(state.copyWith(deletingIds: pending));
      MessageService.showToast(
        msg: result.asError?.error.toString() ?? LocaleKeys.errorGeneric.tr(),
        state: ToastStates.error,
      );
      return;
    }

    emit(state.copyWith(
      deletingIds: pending,
      videos: state.videos.where((v) => v.id != videoId).toList(),
    ));

    final message = result.asValue!.value;
    MessageService.showToast(
      msg: message.isNotEmpty ? message : LocaleKeys.updateProfileVideoDeleted.tr(),
      state: ToastStates.success,
    );
  }

  @override
  Future<void> close() {
    refreshController.dispose();
    return super.close();
  }
}
