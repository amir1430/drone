import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    fontFamily: 'Signika',
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      elevation: 4,
      shadowColor: const Color(0xff457E75).withOpacity(.2),
      color: Colors.white,
      iconTheme: const IconThemeData(color: Color(0xff162119)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    highlightColor: Colors.transparent,
    scaffoldBackgroundColor: const Color.fromARGB(255, 235, 235, 235),
    splashColor: const Color(0xff457E75).withOpacity(.3),
    iconTheme: const IconThemeData(
      color: Color.fromARGB(255, 39, 54, 43),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        shadowColor: const Color(0xff457E75).withOpacity(.05),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        // minimumSize: const Size.fromHeight(80),
        elevation: 2,
        textStyle: const TextStyle(
          fontSize: 16,
          color: Color.fromARGB(255, 202, 238, 211),
        ),
        shadowColor: const Color(0xff457E75).withOpacity(.35),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: const Color(0xff457E75).withOpacity(.8),
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
    shadowColor: const Color(0xff457E75).withOpacity(.05),
    textTheme: const TextTheme(
      caption: TextStyle(
        fontSize: 16,
        color: Color.fromARGB(255, 98, 114, 103),
      ),
      headline1: TextStyle(
        fontSize: 24,
        color: Color(0xff162119),
      ),
      headline2: TextStyle(
        fontSize: 22,
        color: Color(0xff162119),
      ),
      headline3: TextStyle(
        fontSize: 20,
        color: Color(0xff162119),
      ),
      headline4: TextStyle(
        fontSize: 18,
        color: Color(0xff162119),
      ),
      headline5: TextStyle(
        fontSize: 16,
        color: Color(0xff162119),
      ),
      headline6: TextStyle(
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
      primary: Color(0xff457E75),
      secondary: Color(0xff162119),
      error: Color.fromARGB(255, 189, 0, 0),
    ),
    dividerTheme: DividerThemeData(
      color: const Color(0xff457E75).withOpacity(.2),
      endIndent: 12,
      indent: 12,
      space: 8,
    ),
  );
}
