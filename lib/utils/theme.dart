import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff6b538c),
      surfaceTint: Color(0xff6b538c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffeddcff),
      onPrimaryContainer: Color(0xff523c73),
      secondary: Color(0xff645a70),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffebddf7),
      onSecondaryContainer: Color(0xff4c4357),
      tertiary: Color(0xff7f525b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffd9df),
      onTertiaryContainer: Color(0xff653b44),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffef7ff),
      onSurface: Color(0xff1d1a20),
      onSurfaceVariant: Color(0xff4a454e),
      outline: Color(0xff7b757f),
      outlineVariant: Color(0xffccc4cf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff322f35),
      inversePrimary: Color(0xffd6bbfb),
      primaryFixed: Color(0xffeddcff),
      onPrimaryFixed: Color(0xff250e44),
      primaryFixedDim: Color(0xffd6bbfb),
      onPrimaryFixedVariant: Color(0xff523c73),
      secondaryFixed: Color(0xffebddf7),
      onSecondaryFixed: Color(0xff20182a),
      secondaryFixedDim: Color(0xffcec2da),
      onSecondaryFixedVariant: Color(0xff4c4357),
      tertiaryFixed: Color(0xffffd9df),
      onTertiaryFixed: Color(0xff321019),
      tertiaryFixedDim: Color(0xfff2b7c2),
      onTertiaryFixedVariant: Color(0xff653b44),
      surfaceDim: Color(0xffdfd8e0),
      surfaceBright: Color(0xfffef7ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff9f1f9),
      surfaceContainer: Color(0xfff3ecf4),
      surfaceContainerHigh: Color(0xffede6ee),
      surfaceContainerHighest: Color(0xffe7e0e8),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd6bbfb),
      surfaceTint: Color(0xffd6bbfb),
      onPrimary: Color(0xff3b255b),
      primaryContainer: Color(0xff523c73),
      onPrimaryContainer: Color(0xffeddcff),
      secondary: Color(0xffcec2da),
      onSecondary: Color(0xff352d40),
      secondaryContainer: Color(0xff4c4357),
      onSecondaryContainer: Color(0xffebddf7),
      tertiary: Color(0xfff2b7c2),
      onTertiary: Color(0xff4b252e),
      tertiaryContainer: Color(0xff653b44),
      onTertiaryContainer: Color(0xffffd9df),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff151218),
      onSurface: Color(0xffe7e0e8),
      onSurfaceVariant: Color(0xffccc4cf),
      outline: Color(0xff958e99),
      outlineVariant: Color(0xff4a454e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe7e0e8),
      inversePrimary: Color(0xff6b538c),
      primaryFixed: Color(0xffeddcff),
      onPrimaryFixed: Color(0xff250e44),
      primaryFixedDim: Color(0xffd6bbfb),
      onPrimaryFixedVariant: Color(0xff523c73),
      secondaryFixed: Color(0xffebddf7),
      onSecondaryFixed: Color(0xff20182a),
      secondaryFixedDim: Color(0xffcec2da),
      onSecondaryFixedVariant: Color(0xff4c4357),
      tertiaryFixed: Color(0xffffd9df),
      onTertiaryFixed: Color(0xff321019),
      tertiaryFixedDim: Color(0xfff2b7c2),
      onTertiaryFixedVariant: Color(0xff653b44),
      surfaceDim: Color(0xff151218),
      surfaceBright: Color(0xff3b383e),
      surfaceContainerLowest: Color(0xff100d12),
      surfaceContainerLow: Color(0xff1d1a20),
      surfaceContainer: Color(0xff211e24),
      surfaceContainerHigh: Color(0xff2c292f),
      surfaceContainerHighest: Color(0xff37333a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.surface,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
