// lib/features/login/cubit/login_cubit.dart
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dawri/features/login/data/models/login_model.dart';

import '../../../main_common.dart' show getIt;

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  Timer? _timer;

  void updatePhone(String value) {
    emit(state.copyWith(phone: value, hasPhoneError: false));
  }

  void updateOtpDigit(int index, String value) {
    final digits = List<String>.from(state.otpDigits);
    digits[index] = value;
    emit(state.copyWith(otpDigits: digits));
  }

  void setOtpDigits(List<String> digits) {
    emit(state.copyWith(otpDigits: digits));
  }

  Future<void> sendOtp() async {
    if (state.phone.trim().length < LoginConstants.phoneMaxLength) {
      emit(state.copyWith(hasPhoneError: true));
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(hasPhoneError: false));
      return;
    }

    emit(state.copyWith(isSendingOtp: true));
    await Future.delayed(const Duration(milliseconds: 800));
    emit(state.copyWith(
      isSendingOtp: false,
      step: LoginStep.otp,
      otpDigits: List.filled(LoginConstants.otpLength, ''),
    ));
    _startTimer(LoginConstants.resendSeconds);
  }

  void backToPhone() {
    _timer?.cancel();
    emit(state.copyWith(
      step: LoginStep.phone,
      otpDigits: List.filled(LoginConstants.otpLength, ''),
      secondsLeft: 0,
    ));
  }

  void _startTimer(int seconds) {
    _timer?.cancel();
    emit(state.copyWith(secondsLeft: seconds));
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final next = state.secondsLeft - 1;
      if (next <= 0) {
        timer.cancel();
        emit(state.copyWith(secondsLeft: 0));
      } else {
        emit(state.copyWith(secondsLeft: next));
      }
    });
  }

  void resendCode() {
    _startTimer(LoginConstants.resendSeconds);
  }

  Future<void> verifyOtp() async {
    emit(state.copyWith(isVerifying: true));
    await Future.delayed(const Duration(milliseconds: 1500));
    emit(state.copyWith(isVerifying: false, isVerified: true));
    getIt<AppRouter>().replaceAll([
      HomeBottomTabsRoute()
    ], updateExistingRoutes: false);
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}