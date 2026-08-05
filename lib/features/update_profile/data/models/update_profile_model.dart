// lib/features/update_profile/data/models/update_profile_model.dart
class UpdateProfileConstants {
  const UpdateProfileConstants._();

  /// Max profile photo size allowed, in bytes (5 MB).
  static const int maxAvatarSizeBytes = 5 * 1024 * 1024;

  // Participant types that change which "role" list the dropdown shows.
  static const int refereeTypeId = 2;
  static const int coachTypeId = 3;
}
