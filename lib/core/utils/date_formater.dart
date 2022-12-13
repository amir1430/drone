class TimeFormatter {
  static String unixToHuman(
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

  static String unixDifferenceToMmSs({required int start, required int end}) {
    final diff = DateTime.fromMillisecondsSinceEpoch(end * 1000)
        .toUtc()
        .difference(DateTime.fromMillisecondsSinceEpoch(start * 1000).toUtc());

    return '$diff'.substring(2, 7);
  }
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
