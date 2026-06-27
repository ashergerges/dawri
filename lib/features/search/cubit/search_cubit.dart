// lib/features/search/cubit/search_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dawri/features/search/data/models/search_model.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState(query: 'الصقور'));

  void updateQuery(String value) {
    emit(state.copyWith(query: value));
  }

  void clearQuery() {
    emit(state.copyWith(query: ''));
  }

  void selectFilter(SearchFilter filter) {
    emit(state.copyWith(selectedFilter: filter));
  }
}