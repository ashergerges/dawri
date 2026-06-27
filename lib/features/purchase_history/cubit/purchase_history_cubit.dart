// lib/features/purchase_history/cubit/purchase_history_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dawri/features/purchase_history/data/models/purchase_history_model.dart';

part 'purchase_history_state.dart';
part 'purchase_history_cubit.freezed.dart';

class PurchaseHistoryCubit extends Cubit<PurchaseHistoryState> {
  PurchaseHistoryCubit() : super(const PurchaseHistoryState());

  void selectTab(RecordTab tab) {
    emit(state.copyWith(selectedTab: tab));
  }
}