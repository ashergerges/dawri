// lib/features/partner_details/cubit/partner_details_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'partner_details_state.dart';
part 'partner_details_cubit.freezed.dart';

class PartnerDetailsCubit extends Cubit<PartnerDetailsState> {
  PartnerDetailsCubit() : super(const PartnerDetailsState());

  void toggleLike() {
    emit(state.copyWith(isLiked: !state.isLiked));
  }
}