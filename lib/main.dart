import 'dart:async';
import 'package:covid_19_flutter/app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/config/app_configs.dart';

void main() {}

void run(Config config) async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
        .then((_) {
      runApp(
        EasyLocalization(
          path: config.localizationPath,
          supportedLocales: config.supportedLocales,
          fallbackLocale: config.fallbackLocale,
          child: App(),
        ),
      );
    });
  }, (Object error, StackTrace stack) async {
    debugPrint("error");
  });
}

