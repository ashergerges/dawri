// lib/features/partner_details/cubit/partner_videos_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/features/partner_details/data/models/partner_details_model.dart';
import 'package:dawri/features/partner_details/data/repositories/interfaces/i_partner_details_repository.dart';
import 'package:dawri/main_common.dart';
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

  @override
  Future<void> close() {
    refreshController.dispose();
    return super.close();
  }
}
