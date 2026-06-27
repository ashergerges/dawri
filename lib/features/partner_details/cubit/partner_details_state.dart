part of 'partner_details_cubit.dart';

@freezed
abstract class PartnerDetailsState with _$PartnerDetailsState {
  const factory PartnerDetailsState({
    @Default(false) bool isLiked,
  }) = _PartnerDetailsState;
}