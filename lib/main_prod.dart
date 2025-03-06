import 'package:covid_19_flutter/core/config/app_configs.dart';
import 'package:covid_19_flutter/main.dart';
import 'package:flutter/material.dart';

void main() {
  run(
    const Config(
      env: 'prod',
      baseURL: 'https://covid19.ddc.moph.go.th/api',
      supportedLocales: [
        Locale('en', ''),
        Locale('th', ''),
      ],
      fallbackLocale: Locale('th', ''),
    ),
  );
}
