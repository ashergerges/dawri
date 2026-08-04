part of 'partner_reviews_cubit.dart';

@freezed
abstract class PartnerReviewsState with _$PartnerReviewsState {
  const factory PartnerReviewsState({
    @Default([]) List<PartnerReviewModel> reviews,
    PartnerRatingModel? rating,
    @Default(1) int page,
    @Default(PartnerReviewsStatus.initial()) PartnerReviewsStatus status,
  }) = _PartnerReviewsState;

  const PartnerReviewsState._();

  bool get isFirstLoad => status is PartnerReviewsStatusLoading && reviews.isEmpty;
  bool get hasFailed => status is PartnerReviewsStatusError && reviews.isEmpty;
}

@freezed
class PartnerReviewsStatus with _$PartnerReviewsStatus {
  const factory PartnerReviewsStatus.initial() = PartnerReviewsStatusInitial;
  const factory PartnerReviewsStatus.loading() = PartnerReviewsStatusLoading;
  const factory PartnerReviewsStatus.error() = PartnerReviewsStatusError;
  const factory PartnerReviewsStatus.success() = PartnerReviewsStatusSuccess;
}
