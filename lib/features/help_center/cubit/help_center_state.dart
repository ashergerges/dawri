part of 'help_center_cubit.dart';

@freezed
abstract class HelpCenterState with _$HelpCenterState {
  const factory HelpCenterState({
    @Default('') String searchQuery,
    String? openFaqId,
  }) = _HelpCenterState;
}