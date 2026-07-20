// lib/features/login/ui/widgets/resend_timer.dart

/// Ported from Nawy's `ResendCodeTimer` file split. Nawy's version ran
/// its own `Timer.periodic` because `AuthCubit` didn't track a
/// countdown. Dawri's `LoginCubit` already emits `secondsLeft` every
/// second (`_startTimer`), so this file is reduced to the same
/// `mm:ss` formatting logic, kept separate to mirror Nawy's file
/// layout and make it reusable anywhere else a countdown is displayed.
class ResendCodeTimer {
  const ResendCodeTimer._();

  static String format(int seconds) {
    final s = seconds.toString().padLeft(2, '0');
    return '00:$s';
  }
}