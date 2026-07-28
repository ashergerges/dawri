part of 'stadium_profile_cubit.dart';

@freezed
abstract class StadiumProfileState with _$StadiumProfileState {
  const factory StadiumProfileState({
    @Default(0) int activeImageIndex,

    // ─── Details ─────────────────────────────────────────────
    StadiumDetailsModel? stadium,
    @Default(StadiumProfileStatus.initial()) StadiumProfileStatus detailsStatus,
    @Default(false) bool isFavorite,

    // ─── Reviews (bottom sheet) ──────────────────────────────
    @Default([]) List<StadiumReviewModel> reviews,
    @Default(1) int reviewsPage,
    @Default(true) bool hasMoreReviews,
    @Default(StadiumProfileStatus.initial()) StadiumProfileStatus reviewsStatus,

    // ─── Rate ────────────────────────────────────────────────
    @Default(0) int selectedStars,
    @Default('') String comment,
    @Default(StadiumProfileStatus.initial()) StadiumProfileStatus rateSubmitStatus,
  }) = _StadiumProfileState;
}

@freezed
class StadiumProfileStatus with _$StadiumProfileStatus {
  const factory StadiumProfileStatus.initial() = Initial;
  const factory StadiumProfileStatus.loading() = Loading;
  const factory StadiumProfileStatus.error() = Error;
  const factory StadiumProfileStatus.success() = Success;
}