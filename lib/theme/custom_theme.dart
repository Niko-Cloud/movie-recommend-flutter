import 'package:flutter/material.dart';
import 'palette.dart';

class CustomTheme {
  static ThemeData dark(BuildContext context) {
    final theme = ThemeData.dark();

    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: MaterialColor(
        Palette.blue500.value,
        const {
          100: Palette.blue100,
          200: Palette.blue200,
          300: Palette.blue300,
          400: Palette.blue400,
          500: Palette.blue500,
          600: Palette.blue600,
          700: Palette.blue700,
          800: Palette.blue800,
          900: Palette.blue900,
        },
      ),
      hintColor: Palette.blue500,
      scaffoldBackgroundColor: Palette.almostLight,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Palette.almostLight,
      ),
      textTheme: theme.primaryTextTheme
          .copyWith(
            labelMedium: theme.primaryTextTheme.labelMedium?.copyWith(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          )
          .apply(displayColor: Colors.black),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(backgroundColor: Palette.blue500)),
    );
  }
}
