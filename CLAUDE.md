# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

`dawri` — a Flutter mobile app (Arabic/English, RTL-first, Tajawal font) for a sports/championships platform. Backend base host: `https://api-dawry.sanam-ksa.com/`. Flutter SDK ~3.38, Dart `^3.9.2`.

## Commands

```bash
flutter pub get                                    # install deps
flutter run                                        # run on connected device/emulator
flutter analyze                                    # lint (flutter_lints via analysis_options.yaml)

# Code generation — run after touching any freezed / json / injectable / auto_route / asset file
dart run build_runner build --delete-conflicting-outputs

# Regenerate localization keys after editing assets/translations/*.json
dart run easy_localization:generate --source-dir ./assets/translations -f keys -o locale_keys.g.dart -O lib/gen

# Release builds (flavors per README; note: no productFlavors are defined in android/app/build.gradle.kts yet)
flutter build apk --flavor dev  -t lib/main.dart
flutter build apk --flavor prod -t lib/main.dart --release
```

There is **no `test/` directory** — the project currently has no automated tests.

## Architecture

**Feature-first + Cubit + repository.** Everything app-specific lives under `lib/features/<feature>/` with a consistent three-layer shape:

- `cubit/` — `<feature>_cubit.dart`, `<feature>_state.dart` (state is usually a `@freezed` class, generating `<feature>_cubit.freezed.dart`). Cubits hold all logic and call repositories.
- `data/` — `models/` (JSON models with generated `.g.dart`), `repositories/interfaces/i_<feature>_repository.dart` + `repositories/remote/<feature>_repository.dart`.
- `ui/` — screens (annotated `@RoutePage()`) and `ui/widgets/`.

Cross-cutting code lives in `lib/core/` (`services/`, `utils/`, `interfaces/`, `router/`, `cubit/`). Reusable UI is split between `lib/core/utils/common_widgets/` and `lib/features/common/ui/widgets/`.

**Entry point.** `lib/main.dart` → `initMain()` in `lib/main_common.dart`, which: sets the `AppBlocObserver`, inits Firebase, configures EasyLoading, inits EasyLocalization, calls `configureDependencies()` (injectable), starts notifications/downloads, then wraps `App` in `EasyLocalization` + global `MainCubit`/`SplashCubit` providers + `ScreenUtilInit` (design size `390x844`). `lib/app.dart` builds `MaterialApp.router` from `getIt<AppRouter>()`.

**Dependency injection.** `get_it` + `injectable`. The global locator is `getIt` (exported from `lib/main_common.dart`). Register a service by annotating it (`@singleton`, `@lazySingleton`, or `@Injectable(as: ISomeInterface)`) then re-running build_runner — this regenerates `lib/main_common.config.dart`. Cubits resolve their repositories via `getIt<IFoo>()` (see `LoginCubit`), so they can also be constructed with an injected repo for testing.

**Navigation.** `auto_route`. `lib/core/router/app_router.dart` (`AppRouter extends RootStackRouter`, `@AutoRouterConfig(replaceInRouteName: 'Screen,Route')`) lists every route; `.gr.dart` is generated. A screen named `FooScreen` becomes `FooRoute`. `SplashRoute` is `initial`, `NotFoundRoute` (`path: '*'`) must stay last. Navigate imperatively via `getIt<AppRouter>()` (e.g. `.replaceAll([HomeBottomTabsRoute()])`).

**Networking.** `Dio` is wrapped by `NetworkService` (`lib/core/services/network/network_service.dart`, `@singleton`). All methods return `Result<Response>` from the `async` package (`Result.value` / `Result.error`). The service inspects the JSON body: a response is treated as an **error unless `body['status'] == true`**, surfacing `result.message` or `message`. Repositories call `NetworkService`, check `response.isError`, and return typed `Result<T>` (parsing `response.asValue!.value.data['data']`). Interceptors: `AuthInterceptor` (token attach/refresh), `ConnectionInterceptor`; in debug or `DEV`/`QC` flavor, Alice + `PrettyDioLogger` are added.

**Config & constants.** `AppStrings` (`lib/core/utils/constants/constants.dart`) is the central accessor: `AppStrings.urls` (endpoints), `AppStrings.baseUrl` (from `BaseUrl.url`, flavor-switched via the global `appFlavor`), `AppStrings.prefKeys`, `AppStrings.translations`, `AppStrings.userTypes`. Add endpoints in `lib/core/utils/constants/endpoints.dart`.

**Localization.** `easy_localization` with JSON in `assets/translations/` (`ar` default, `en`). Reference strings via the generated `LocaleKeys` (`lib/gen/locale_keys.g.dart`) + `.tr()`. Regenerate keys with the command above, not by hand.

**Generated files (do not edit; regenerate via build_runner):** `*.freezed.dart`, `*.g.dart`, `*.gr.dart`, `main_common.config.dart`, and `lib/gen/` (`assets.gen.dart`, `fonts.gen.dart`, `locale_keys.g.dart`).
