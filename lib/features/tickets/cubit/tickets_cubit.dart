// lib/features/tickets/cubit/tickets_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dawri/features/tickets/data/models/tickets_model.dart';

part 'tickets_state.dart';
part 'tickets_cubit.freezed.dart';

class TicketsCubit extends Cubit<TicketsState> {
  TicketsCubit() : super(const TicketsState());

  void selectTab(int index) {
    emit(state.copyWith(selectedTabIndex: index));
  }

  void bookMatch(UpcomingMatchModel match) {
    emit(state.copyWith(showSuccessModal: true, lastBookedMatch: match));
  }

  void dismissSuccessModal() {
    emit(state.copyWith(showSuccessModal: false));
  }

  /// Closes the modal and switches to the "My Tickets" tab.
  void viewTicketFromModal() {
    emit(state.copyWith(showSuccessModal: false, selectedTabIndex: 1));
  }
}