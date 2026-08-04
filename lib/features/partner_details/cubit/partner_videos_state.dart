part of 'partner_videos_cubit.dart';

@freezed
abstract class PartnerVideosState with _$PartnerVideosState {
  const factory PartnerVideosState({
    @Default([]) List<PartnerVideoModel> videos,
    @Default(1) int page,
    @Default(PartnerVideosStatus.initial()) PartnerVideosStatus status,
  }) = _PartnerVideosState;

  const PartnerVideosState._();

  bool get isFirstLoad => status is PartnerVideosStatusLoading && videos.isEmpty;
  bool get hasFailed => status is PartnerVideosStatusError && videos.isEmpty;
}

@freezed
class PartnerVideosStatus with _$PartnerVideosStatus {
  const factory PartnerVideosStatus.initial() = PartnerVideosStatusInitial;
  const factory PartnerVideosStatus.loading() = PartnerVideosStatusLoading;
  const factory PartnerVideosStatus.error() = PartnerVideosStatusError;
  const factory PartnerVideosStatus.success() = PartnerVideosStatusSuccess;
}
