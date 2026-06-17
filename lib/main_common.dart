import 'dart:developer';
import 'package:dawri/core/cubit/bloc_observer.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/features/common/cubit/main_cubit/main_cubit.dart';
import 'package:dawri/features/splash/cubits/splash_cubit/splash_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'core/services/download/download_service.dart';
import 'core/services/notification/notifications_service.dart';
import 'core/utils/constants/app_colors.dart';
import 'main_common.config.dart';

final getIt = GetIt.instance;

const double loadingIndicatorSize = 70.0;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() => $initGetIt(getIt);

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = AppColors.primary
    ..backgroundColor = Colors.transparent
    ..textColor = Colors.black
    ..indicatorColor = AppColors.primary
    ..userInteractions = true
    ..boxShadow = <BoxShadow>[]
    ..indicatorWidget = LoadingAnimationWidget.discreteCircle(
      color: Colors.transparent,
      secondRingColor: Colors.transparent,
      thirdRingColor: Colors.transparent,
      size: loadingIndicatorSize,
    )
    ..dismissOnTap = false;
}

Future<void> initFirebase() async {
  try {
    if (await InternetConnectionChecker().hasConnection) {
      await Firebase.initializeApp().then((value) async {
        if (kDebugMode) {
          final String fcm = await FirebaseMessaging.instance.getToken() ?? '';
          log(name: 'fcm::T', fcm);
        }
      });
    }
  } catch (e) {
    log("Firebase init error: ${e.toString()}");
  }
}

Future<Widget> initMain(Widget child) async {
  Bloc.observer = AppBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();

  await initFirebase();

  configLoading();
  await EasyLocalization.ensureInitialized();

  configureDependencies();
  await getIt<NotificationService>().initNotifications();
  await DownloadService.downloadFilesInit();
  log("downloadFilesInit");
  return EasyLocalization(
    supportedLocales: [
      Locale(AppStrings.translations.localeAr),
      Locale(AppStrings.translations.localeEN),
    ],
    path: 'assets/translations',
    startLocale: Locale(AppStrings.translations.localeDefault),
    fallbackLocale: Locale(AppStrings.translations.localeDefault),
    useOnlyLangCode: true,
    ignorePluralRules: false,
    child: BlocProvider(
      lazy: false,
      create: (context) => MainCubit(),
      child: BlocProvider(
        create: (context) => SplashCubit(),
        child: ScreenUtilInit(
          designSize: const Size(390, 844),
          minTextAdapt: true,
          splitScreenMode: true,
          child: child,
        ),
      ),
    ),
  );
}
