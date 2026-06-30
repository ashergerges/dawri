import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stadium_profile_state.dart';
part 'stadium_profile_cubit.freezed.dart';

class StadiumProfileCubit extends Cubit<StadiumProfileState> {
  StadiumProfileCubit() : super(const StadiumProfileState());

  void setActiveImage(int index) => emit(state.copyWith(activeImageIndex: index));

  void toggleFavorite() => emit(state.copyWith(isFavorite: !state.isFavorite));
}