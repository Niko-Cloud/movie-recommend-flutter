import 'package:flutter/material.dart';
import 'palette.dart';

class CustomTheme {
  static ThemeData dark(BuildContext context) {
    final theme = ThemeData.dark();

    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: MaterialColor(
        Palette.blue100.value,
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
      colorScheme: theme.colorScheme.copyWith(
        primary: Palette.blue500
      ),
      scaffoldBackgroundColor: Palette.almostBlack,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Palette.almostBlack,
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: Colors.white,
        inactiveTrackColor: Colors.blueGrey,
        inactiveTickMarkColor: Colors.transparent,
        activeTickMarkColor: Colors.transparent,
        thumbColor: Colors.white,
        overlayColor: Colors.white.withOpacity(0.2),
        trackHeight: 2,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
      ),
      textTheme: theme.primaryTextTheme
          .copyWith(
            labelMedium: theme.primaryTextTheme.labelLarge?.copyWith(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          )
          .apply(displayColor: Colors.white),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(backgroundColor: Palette.blue500)),
    );
  }
}
