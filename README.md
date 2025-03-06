# covid-19-flutter-project
covid-19 create by flutter-project for Interviews for Frontend Developer roles will include this session.

# flutter version development
Flutter 3.27.3
Tools • Dart 3.6.1 • DevTools 2.40.2

# gradle and kotlin 
gradle-8.3
1.8.22

# covid_19_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



### Generate assets and classes
------
#### Flutter Launcher Icons 
1. Setup the config file 
   Replace your app icon to `assets/icon/icon_android.png` and `assets/icon/icon_ios.png`
2. Run the package 
   
``` console
$ flutter pub run flutter_launcher_icons:main
```

#### Generate model .g

``` console
$ flutter packages pub run build_runner build --delete-conflicting-outputs
```
-------


### Build the app
#### Dev
```console
IOS: 
flutter build ipa -t lib/main_dev.dart --flavor dev

ANDROID: 
flutter build apk --flavor dev -t lib/main_dev.dart
```

#### Prod
```console
IOS: 
flutter build ipa -t lib/main_prod.dart --flavor prod

ANDROID: 
flutter build appbundle -t lib/main_prod.dart --flavor prod
```
