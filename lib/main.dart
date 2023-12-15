import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kartal/kartal.dart';
import 'package:scanxpert/firebase_options.dart';
import 'package:scanxpert/src/constants/app_constants.dart';
import 'package:scanxpert/src/core/managements/router.dart';
import 'package:scanxpert/src/core/managements/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        kALocaleTr,
        kALocaleEn,
      ],
      path: kATranslationsPath,
      fallbackLocale: kALocaleEn,
      child: ScanApp(savedThemeMode: savedThemeMode),
    ),
  );
}

class ScanApp extends StatelessWidget {
  ScanApp({super.key, this.savedThemeMode});

  final AdaptiveThemeMode? savedThemeMode;
  final _router = GoRouter(
    observers: [
      BotToastNavigatorObserver(),
    ],
    routes: Routes.values
        .map(
          (e) => GoRoute(
            path: e.getPath,
            builder: (context, state) => e.getPage(state),
          ),
        )
        .toList(),
  );

  @override
  Widget build(BuildContext context) {
    final ThemeCreator themeCreator = ThemeCreator(context);

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return AdaptiveTheme(
          light: themeCreator.getLightTheme(),
          dark: themeCreator.getDarkTheme(),
          initial: savedThemeMode ??
              (context.general.appBrightness == Brightness.dark
                  ? AdaptiveThemeMode.dark
                  : AdaptiveThemeMode.light),
          builder: (theme, darkTheme) {
            return MaterialApp.router(
              title: 'ScanXpert',
              builder: BotToastInit(),
              theme: theme,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: (context).localizationDelegates,
              supportedLocales: (context).supportedLocales,
              locale: (context).locale,
              routerConfig: _router,
            );
          },
        );
      },
    );
  }
}
