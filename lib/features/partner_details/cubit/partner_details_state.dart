part of 'partner_details_cubit.dart';

@freezed
abstract class PartnerDetailsState with _$PartnerDetailsState {
  const factory PartnerDetailsState({
    PartnerDetailsModel? partner,
    @Default(PartnerDetailsStatus.initial()) PartnerDetailsStatus detailsStatus,

    /// Kept apart from [partner] so the heart flips instantly (optimistic).
    @Default(false) bool isFavorite,

    /// Videos whose view the server counted during this visit. Held separately
    /// because [videos] is derived from [partner], which has no copyWith —
    /// cleared on reload, when the fresh payload already includes them.
    @Default(<int>{}) Set<int> extraViewIds,
  }) = _PartnerDetailsState;

  const PartnerDetailsState._();

  bool get isLoading => detailsStatus is PartnerDetailsStatusLoading;
  bool get hasError => detailsStatus is PartnerDetailsStatusError;

  /// Contract button shows only for available partners.
  bool get canOfferContract => partner?.isAvailable == true;

  List<PartnerVideoModel> get videos {
    final items = partner?.videos?.items ?? const <PartnerVideoModel>[];
    if (extraViewIds.isEmpty) return items;
    return items
        .map((v) => extraViewIds.contains(v.id) ? v.withExtraView() : v)
        .toList();
  }
  List<PartnerReviewModel> get reviews => partner?.reviews?.items ?? const [];
  List<ParticipantRefModel> get tags => partner?.tags ?? const [];
}

@freezed
class PartnerDetailsStatus with _$PartnerDetailsStatus {
  const factory PartnerDetailsStatus.initial() = PartnerDetailsStatusInitial;
  const factory PartnerDetailsStatus.loading() = PartnerDetailsStatusLoading;
  const factory PartnerDetailsStatus.error() = PartnerDetailsStatusError;
  const factory PartnerDetailsStatus.success() = PartnerDetailsStatusSuccess;
}
