part of 'stadium_profile_cubit.dart';

@freezed
abstract class StadiumProfileState with _$StadiumProfileState {
  const factory StadiumProfileState({
    @Default(0) int activeImageIndex,
    @Default(false) bool isFavorite,
  }) = _StadiumProfileState;
}