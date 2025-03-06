import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'core/config/router.dart';
import 'core/config/theme.dart';
import 'core/presentation/pages/splash_screen.dart';
import 'core/utils/navigator_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      initialRoute: SplashScreen.route,
      routes: AppRouter.routes,
      theme: AppTheme.themeData,
      title: 'covid-19-flutter',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      // navigatorObservers: env == 'dev' ? [ChuckerFlutter.navigatorObserver] : [], open comment install lib chuckker when want to use chuckker
      ),
    );
  }
}
