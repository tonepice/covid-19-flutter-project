import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _highlightColor = Color.fromARGB(255, 12, 129, 94);
  static const _primaryColor = Color.fromARGB(255, 4, 143, 103);
  static const _backgroundColor = Color.fromARGB(255, 255, 255, 255);
  static const _cardColor = Color.fromARGB(255, 252, 215, 82);
  static const _textColor = Colors.black;
  static const _headerColor = Colors.black;
  static final _subtitle1 = GoogleFonts.k2d(
    fontWeight: _medium,
    color: _textColor,
    fontSize: 12.0,
  );
  static const double _tabbarIconSize = 25;

  static final TextTheme _textTheme = TextTheme(
    displayLarge: GoogleFonts.k2d(
      fontWeight: _semiBold,
      color: _headerColor,
      fontSize: 30.0,
    ),
    displayMedium: GoogleFonts.k2d(
      fontWeight: _semiBold,
      color: _headerColor,
      fontSize: 28.0,
    ),
    displaySmall: GoogleFonts.k2d(
      fontWeight: _medium,
      color: _headerColor,
      fontSize: 22.0,
    ),
    headlineMedium: GoogleFonts.k2d(
      fontWeight: _medium,
      color: _headerColor,
      fontSize: 20.0,
    ),
    headlineSmall: GoogleFonts.k2d(
      fontWeight: _semiBold,
      color: _headerColor,
      fontSize: 18.0,
    ),
    titleLarge: GoogleFonts.k2d(
      fontWeight: _medium,
      fontSize: 16.0,
      color: _headerColor,
    ),
    bodyLarge: GoogleFonts.k2d(
      fontSize: 14.0,
      color: _textColor,
    ),
    bodyMedium: GoogleFonts.k2d(
      fontSize: 16.0,
      color: _textColor,
    ),
    bodySmall: GoogleFonts.k2d(
      fontWeight: _semiBold,
      color: _textColor,
      fontSize: 16.0,
    ),
    titleMedium: _subtitle1,
    titleSmall: GoogleFonts.k2d(
      fontWeight: _medium,
      fontSize: 12.0,
      color: _textColor,
    ),
    labelSmall: GoogleFonts.k2d(
      fontWeight: _medium,
      color: _textColor,
      fontSize: 12.0,
    ),
    labelLarge: GoogleFonts.k2d(
      fontWeight: _medium,
      fontSize: 14.0,
      color: _textColor,
    ),
  );

  static ThemeData get themeData => ThemeData(
        scaffoldBackgroundColor: _backgroundColor,
        highlightColor: _highlightColor,
        primaryColor: _primaryColor,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: _backgroundColor),
        cardColor: _cardColor,
        dividerColor: const Color(0xFFEEEEEE),
        hintColor: const Color(0xFF999999),
        appBarTheme: _appBarTheme,
        unselectedWidgetColor: const Color(0xFF999999),
        bottomNavigationBarTheme: _bottomNavigationBarTheme,
        fontFamily: 'K2D',
      );

  static AppBarTheme get _appBarTheme => AppBarTheme(
        iconTheme: const IconThemeData(
          color: _primaryColor,
        ),
        titleTextStyle: _textTheme.titleLarge,
        color: Colors.white,
        elevation: 1,
        centerTitle: true,
      );

  static BottomNavigationBarThemeData get _bottomNavigationBarTheme =>
      BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        unselectedLabelStyle: _subtitle1,
        selectedLabelStyle: _subtitle1,
        selectedItemColor: _highlightColor,
        selectedIconTheme: const IconThemeData(
          color: _highlightColor,
          size: _tabbarIconSize,
        ),
        unselectedIconTheme: const IconThemeData(
          size: _tabbarIconSize,
        ),
      );
}
