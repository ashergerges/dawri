// lib/features/login/cubit/login_cubit.dart
import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dawri/core/interfaces/i_local_preference.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dawri/features/login/data/models/login_model.dart';
import 'package:dawri/features/login/data/repository/interface/i_login_repository.dart';

import '../../../main_common.dart' show getIt;

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({IAuthRepo? authRepo})
      : _authRepo = authRepo ?? getIt<IAuthRepo>(),
        super(const LoginState());

  final IAuthRepo _authRepo;
  Timer? _timer;

  // ─── PHONE STEP ───────────────────────────────────────────────────────────
  void updatePhone(String value) {
    emit(state.copyWith(phone: value, hasPhoneError: false, phoneErrorKey: null));
  }

  bool _validatePhone() {
    final phone = state.phone.trim();
    if (phone.isEmpty) {
      emit(state.copyWith(hasPhoneError: true, phoneErrorKey: LocaleKeys.loginPhoneRequired));
      return false;
    }
    if (!LoginConstants.isValidPhone(phone)) {
      emit(state.copyWith(hasPhoneError: true, phoneErrorKey: LocaleKeys.loginPhoneInvalid));
      return false;
    }
    return true;
  }

  Future<void> sendOtp() async {
    if (!_validatePhone() || state.isSendingOtp) return;

    emit(state.copyWith(isSendingOtp: true, generalErrorKey: null));

    final result = await _authRepo.login(phone: state.phone.trim());

    if (result.isError) {
      emit(state.copyWith(isSendingOtp: false, generalErrorKey: LocaleKeys.errorGeneric));
      return;
    }

    emit(state.copyWith(
      isSendingOtp: false,
      step: LoginStep.otp,
      otpDigits: List.filled(LoginConstants.otpLength, ''),
      hasOtpError: false,
      otpErrorKey: null,
    ));
    _startTimer(LoginConstants.resendSeconds);
  }

  Future<void> resendCode() async {
    if (state.secondsLeft > 0) return;

    final result = await _authRepo.resendOtp(phone: state.phone.trim());

    if (result.isError) {
      emit(state.copyWith(generalErrorKey: LocaleKeys.errorGeneric));
      return;
    }

    emit(state.copyWith(otpDigits: List.filled(LoginConstants.otpLength, '')));
    _startTimer(LoginConstants.resendSeconds);
  }

  void backToPhone() {
    _timer?.cancel();
    emit(state.copyWith(
      step: LoginStep.phone,
      otpDigits: List.filled(LoginConstants.otpLength, ''),
      secondsLeft: 0,
      isVerified: false,
    ));
  }

  // ─── OTP STEP ─────────────────────────────────────────────────────────────
  void updateOtpDigit(int index, String value) {
    final digits = List<String>.from(state.otpDigits);
    digits[index] = value;
    emit(state.copyWith(otpDigits: digits, hasOtpError: false, otpErrorKey: null));
  }

  void setOtpDigits(List<String> digits) {
    emit(state.copyWith(otpDigits: digits, hasOtpError: false, otpErrorKey: null));
  }

  bool _validateOtp() {
    if (state.otpDigits.any((d) => d.isEmpty) || state.otpDigits.length != LoginConstants.otpLength) {
      emit(state.copyWith(hasOtpError: true, otpErrorKey: LocaleKeys.loginOtpIncomplete));
      return false;
    }
    return true;
  }

  Future<void> verifyOtp() async {
    if (!_validateOtp() || state.isVerifying) return;

    emit(state.copyWith(isVerifying: true, generalErrorKey: null));

    final result = await _authRepo.verifyOtp(
      phone: state.phone.trim(),
      code: state.otpDigits.join(),
    );

    if (result.isError) {
      emit(state.copyWith(
        isVerifying: false,
        hasOtpError: true,
        otpErrorKey: LocaleKeys.loginOtpInvalid,
      ));
      return;
    }

    getIt<ILocalPreference>().saveAppUser(
      result.asValue?.value.user?.copyWith(
        token: result.asValue?.value.token,
      ),
    );
    log("validateOtp.asValue?.value.token::${result.asValue?.value.token}");
    log("appUser::${getIt<ILocalPreference>().appUser.value?.token}");    // local session storage (whatever holds AppUser elsewhere) before routing.
    emit(state.copyWith(isVerifying: false, isVerified: true));

    getIt<AppRouter>().replaceAll(
      [HomeBottomTabsRoute()],
      updateExistingRoutes: false,
    );
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

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}