// lib/features/update_profile/data/models/update_profile_model.dart
class UpdateProfileConstants {
  const UpdateProfileConstants._();

  /// Max profile photo size allowed, in bytes (5 MB).
  static const int maxAvatarSizeBytes = 5 * 1024 * 1024;

  // Participant types that change which "role" list the dropdown shows.
  static const int refereeTypeId = 2;
  static const int coachTypeId = 3;

  /// How many videos the profile screen previews before "see all" takes over.
  static const int videosPreviewCount = 3;

  /// Matches watch / youtu.be / shorts / embed links, with or without scheme,
  /// `www.`/`m.`, or trailing query params (`?si=…`).
  static final RegExp _youtubeUrl = RegExp(
    r'^(https?://)?((www|m)\.)?'
    r'(youtube\.com/(watch\?v=|shorts/|embed/)[\w-]{11}'
    r'|youtu\.be/[\w-]{11})',
    caseSensitive: false,
  );

  static bool isYoutubeUrl(String value) =>
      _youtubeUrl.hasMatch(value.trim());
}
