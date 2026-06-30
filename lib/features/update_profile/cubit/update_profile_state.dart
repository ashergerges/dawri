part of 'update_profile_cubit.dart';

@freezed
abstract class UpdateProfileState with _$UpdateProfileState {
  const factory UpdateProfileState({
    @Default(UpdateProfileMockData.currentAvatarUrl) String avatarPath,
    @Default(false) bool isLocalAvatar,
    @Default(true) bool reminderNotifications,
    @Default(true) bool walletAlerts,
    @Default(false) bool darkMode,
    @Default(false) bool isPickingAvatar,
    @Default(null) String? avatarError,
    @Default(false) bool isUpdating,
    @Default(false) bool isSuccess,
  }) = _UpdateProfileState;
}