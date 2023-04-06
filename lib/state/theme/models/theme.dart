import 'package:flutter/material.dart'
    show
        ButtonStyle,
        CircleBorder,
        Color,
        ColorScheme,
        Colors,
        FontWeight,
        IconButtonThemeData,
        IconThemeData,
        MaterialStatePropertyAll,
        TextStyle,
        TextTheme,
        ThemeData,
        immutable;

@immutable
class Theme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: Colors.grey.shade50,
      onPrimary: Colors.black87,
      secondary: Colors.indigo,
      onSecondary: Colors.white,
    ),
    //
    textTheme: const TextTheme(
      titleSmall: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 40,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 17,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      displayMedium: TextStyle(
        color: Colors.black87,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
    //------------------
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    //------------------
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(CircleBorder()),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      primary: Colors.grey.shade50,
      onPrimary: Colors.black87,
      onSecondary: Colors.white,
    ),
    //
    textTheme: const TextTheme(
      titleSmall: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 40,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 17,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      displayMedium: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
    //------------------
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    //------------------
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(CircleBorder()),
      ),
    ),
  );
  const Theme._();
}
