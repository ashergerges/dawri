// lib/features/partners/cubit/partners_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/features/partners/data/models/partners_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'partners_state.dart';
part 'partners_cubit.freezed.dart';

class PartnersCubit extends Cubit<PartnersState> {
  PartnersCubit() : super(const PartnersState());

  void selectTab(ParticipantTab tab) {
    emit(state.copyWith(selectedTab: tab));
  }

  void updateSearchQuery(String value) {
    emit(state.copyWith(searchQuery: value));
  }
}