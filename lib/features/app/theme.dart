import 'package:flutter/material.dart';

class AppTheme {
  static const int _primaryCode = 0xffbd2930;
  static const int _secondaryCode = 0xFF292f32;
  static const int _backgroundCode = 0xfffafcfc;

  static ThemeData theme = ThemeData(
    // fontFamily: 'Signika',?
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      elevation: 2,
      scrolledUnderElevation: 0,
      shadowColor: const Color(0xFF4E5FFF).withOpacity(.2),
      color: Colors.white,
      iconTheme: const IconThemeData(color: Color(0xff162119)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    highlightColor: Colors.transparent,
    // scaffoldBackgroundColor: const Color.fromARGB(255, 235, 235, 235),
    splashColor: const Color(_secondaryCode).withOpacity(.2),
    iconTheme: const IconThemeData(
      color: Color.fromARGB(255, 39, 54, 43),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        // minimumSize: const Size.fromHeight(48),
        elevation: 0,
        foregroundColor: const Color(_secondaryCode),
        disabledBackgroundColor: const Color(_backgroundCode),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(_primaryCode),
        disabledForegroundColor: const Color(_secondaryCode),
        disabledBackgroundColor: Colors.transparent,
        foregroundColor: const Color(_backgroundCode),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        elevation: 0,
        shadowColor: const Color(_secondaryCode).withOpacity(.35),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: const Color(_primaryCode).withOpacity(.8),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: const Color.fromARGB(255, 233, 233, 233),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    shadowColor: const Color(_primaryCode).withOpacity(.05),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontSize: 16,
        color: Color.fromARGB(255, 98, 114, 103),
      ),
      displayLarge: TextStyle(
        fontSize: 24,
        color: Color(0xff162119),
      ),
      displayMedium: TextStyle(
        fontSize: 22,
        color: Color(0xff162119),
      ),
      displaySmall: TextStyle(
        fontSize: 20,
        color: Color(0xff162119),
      ),
      headlineMedium: TextStyle(
        fontSize: 18,
        color: Color(0xff162119),
      ),
      headlineSmall: TextStyle(
        fontSize: 16,
        color: Color(0xff162119),
      ),
      titleLarge: TextStyle(
        fontSize: 14,
        color: Color(0xff162119),
      ),
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Color(_primaryCode),
      secondary: Color(_secondaryCode),
      background: Color(_backgroundCode),
      error: Color(_primaryCode),
    ),
    dividerColor: Colors.transparent,
// dropdownMenuTheme: DropdownMenuThemeData(menuStyle: MenuStyle(shape: )),
    dividerTheme: DividerThemeData(
      color: const Color(_primaryCode).withOpacity(.2),
      endIndent: 12,
      indent: 12,
      space: 8,
    ),
  );
}
