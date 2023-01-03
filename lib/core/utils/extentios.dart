import 'package:drone/core/core.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

extension BuildContextX on BuildContext {
  Size get size => MediaQuery.of(this).size;
  double get width => size.width;
  double get height => size.height;

  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;

  Color get primaryColor => colorScheme.primary;
  Color get secondaryColor => colorScheme.secondary;
  Color get errorColor => colorScheme.error;
  Color get iconColor => theme.iconTheme.color!;
  Color get backgroundColor => theme.scaffoldBackgroundColor;

  TextTheme get textTheme => theme.textTheme;
  TextStyle? get headline1 => textTheme.headline1;
  TextStyle? get headline2 => textTheme.headline2;
  TextStyle? get headline3 => textTheme.headline3;
  TextStyle? get headline4 => textTheme.headline4;
  TextStyle? get headline5 => textTheme.headline5;
  TextStyle? get headline6 => textTheme.headline6;
  TextStyle? get caption => textTheme.caption;

  ScaffoldState get scaffold => Scaffold.of(this);
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
  void get openDrawer => scaffold.openDrawer();

  NavigatorState get navigator => Navigator.of(this);

  void toDialog({required Widget child, bool dismissible = true}) {
    showDialog<Widget>(
      context: this,
      barrierDismissible: dismissible,
      builder: (context) => child,
    );
  }
}

extension StatusX on String {
  String? get extractNumber {
    return RegExp(r'\d+').firstMatch(this)?[0];
  }

  String get subStr8 => substring(0, 8);

  IconData targetToIcon() {
    switch (this) {
      case 'production':
        return Ionicons.cube_outline;
      default:
        return Ionicons.git_branch_outline;
    }
  }
}

extension IntX on int {
  String get unixToHuman => _format(this);
}

String _format(
  int date,
) {
  final _clock = DateTime.now();
  final _date = DateTime.fromMillisecondsSinceEpoch(date);
  var elapsed = _clock.millisecondsSinceEpoch ~/ 1000 - date;

  String prefix, suffix;

  if (elapsed < 0) {
    elapsed = _date.isBefore(_clock) ? elapsed : elapsed.abs();
    prefix = _Messages.prefixFromNow();
    suffix = _Messages.suffixFromNow();
  } else {
    prefix = _Messages.prefixAgo();
    suffix = _Messages.suffixAgo();
  }

  final num seconds = elapsed;
  final num minutes = seconds / 60;
  final num hours = minutes / 60;
  final num days = hours / 24;
  final num months = days / 30;
  final num years = days / 365;

  String result;
  if (seconds < 45) {
    result = _Messages.lessThanOneMinute(seconds.round());
  } else if (seconds < 90) {
    result = _Messages.aboutAMinute(minutes.round());
  } else if (minutes < 45) {
    result = _Messages.minutes(minutes.round());
  } else if (minutes < 90) {
    result = _Messages.aboutAnHour(minutes.round());
  } else if (hours < 24) {
    result = _Messages.hours(hours.round());
  } else if (hours < 48) {
    result = _Messages.aDay(hours.round());
  } else if (days < 30) {
    result = _Messages.days(days.round());
  } else if (days < 60) {
    result = _Messages.aboutAMonth(days.round());
  } else if (days < 365) {
    result = _Messages.months(months.round());
  } else if (years < 2) {
    result = _Messages.aboutAYear(months.round());
  } else {
    result = _Messages.years(years.round());
  }

  return [prefix, result, suffix]
      .where((str) => str.isNotEmpty)
      .join(_Messages.wordSeparator());
}

class _Messages {
  static String prefixAgo() => '';
  static String prefixFromNow() => '';
  static String suffixAgo() => 'ago';
  static String suffixFromNow() => 'from now';
  static String lessThanOneMinute(int seconds) => '$seconds seconds';
  static String aboutAMinute(int minutes) => 'a minute';
  static String minutes(int minutes) => '$minutes minutes';
  static String aboutAnHour(int minutes) => 'hour a ';
  static String hours(int hours) => '$hours hours';
  static String aDay(int hours) => 'a day';
  static String days(int days) => '$days days';
  static String aboutAMonth(int days) => 'month a';
  static String months(int months) => '$months months';
  static String aboutAYear(int year) => 'year a go';
  static String years(int years) => '$years years';
  static String wordSeparator() => ' ';
}

extension WidgetX on Widget {
  Widget toVisibility({
    Widget replacement = const SizedBox.shrink(),
    required bool visible,
  }) {
    return Visibility(
      visible: visible,
      replacement: replacement,
      child: this,
    );
  }
}
