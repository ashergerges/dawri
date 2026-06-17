import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData get appTheme =>
    ThemeData.from(colorScheme: lightColorScheme, useMaterial3: true).copyWith(
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          systemStatusBarContrastEnforced: true,
        ),
        backgroundColor: AppColors.white,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      scaffoldBackgroundColor: AppColors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: AppColors.primary100, // background
        selectionHandleColor: AppColors.primary300, // handles
        cursorColor: AppColors.primary,
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),

    );

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.primary50,
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFFFFFFF),
  onPrimaryContainer: Color(0xFF001F25),
  secondary: Color(0xFFFBBC15),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFFDEA1),
  onSecondaryContainer: Color(0xFF261900),
  tertiary: Color(0xFF006874),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFF97F0FF),
  onTertiaryContainer: Color(0xFF001F24),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  surface: Colors.transparent,
  onSurface: Color(0xFF001F25),
  surfaceContainerHighest: Color(0xFFDBE4E6),
  onSurfaceVariant: Color(0xFF3F484A),
  outline: Color(0xFF6F797B),
  onInverseSurface: Color(0xFFD6F6FF),
  inverseSurface: Color(0xFF00363F),
  inversePrimary: Color(0xFF51D7EF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF263572),
  outlineVariant: Color(0xFFBFC8CA),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF51D7EF),
  onPrimary: Color(0xFF00363E),
  primaryContainer: Color(0xFF004E59),
  onPrimaryContainer: Color(0xFFA1EFFF),
  secondary: Color(0xFFFBBC15),
  onSecondary: Color(0xFF402D00),
  secondaryContainer: Color(0xFF5C4300),
  onSecondaryContainer: Color(0xFFFFDEA1),
  tertiary: Color(0xFF4FD8EB),
  onTertiary: Color(0xFF00363D),
  tertiaryContainer: Color(0xFF004F58),
  onTertiaryContainer: Color(0xFF97F0FF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  surface: Color(0xFF001F25),
  onSurface: Color(0xFFA6EEFF),
  surfaceContainerHighest: Color(0xFF3F484A),
  onSurfaceVariant: Color(0xFFBFC8CA),
  outline: Color(0xFF899295),
  onInverseSurface: Color(0xFF001F25),
  inverseSurface: Color(0xFFA6EEFF),
  inversePrimary: Color(0xFF263572),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF51D7EF),
  outlineVariant: Color(0xFF3F484A),
  scrim: Color(0xFF000000),
);

extension TextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}
