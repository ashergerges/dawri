import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dawri/core/interfaces/i_local_preference.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../main_common.dart';

part 'main_cubit.freezed.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit()
    : localPreference = getIt<ILocalPreference>(),
      super(const MainState.initial());

  final ILocalPreference localPreference;

}
