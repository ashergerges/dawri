// lib/features/help_center/cubit/help_center_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'help_center_state.dart';
part 'help_center_cubit.freezed.dart';

class HelpCenterCubit extends Cubit<HelpCenterState> {
  HelpCenterCubit() : super(const HelpCenterState());

  void updateSearch(String value) {
    emit(state.copyWith(searchQuery: value));
  }

  void toggleFaq(String id) {
    final isAlreadyOpen = state.openFaqId == id;
    emit(state.copyWith(openFaqId: isAlreadyOpen ? null : id));
  }
}