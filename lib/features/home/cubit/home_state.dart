part of 'home_cubit.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default('محمد') String userName,
    @Default(true) bool hasNotifications,
    @Default('') String searchQuery,
  }) = _HomeState;
}
@freezed
class HomeStateStatus with _$HomeStateStatus {
  const factory HomeStateStatus.initial() = Initial;
  const factory HomeStateStatus.loading() = Loading;
  const factory HomeStateStatus.error() = Error;
  const factory HomeStateStatus.success() = Success;
}