import 'package:date_format/date_format.dart';

class DateTimeFormat {
  /// **[HH, ':', nn, ' - ', dd, '/', mm, '/', yyyy]**
  ///
  /// **10:59 - 01/01/2000**
  final HHnnddmmyyyy = [HH, ':', nn, ' - ', dd, '/', mm, '/', yyyy];

  /// **[HH, ':', nn, ' - ', dd, '/', mm]**
  ///
  /// **10:59 - 01/01/2000**
  final HHnnddmm = [HH, ':', nn, ' - ', dd, '/', mm];

  /// **[HH, ':', nn, ' ', dd, '/', mm, '/', yyyy]**
  ///
  /// **01/01/2000 10:59**
  final ddmmyyyyHHnn = [dd, '/', mm, '/', yyyy, ' ', HH, ':', nn];

  /// **[dd, '/', mm]**
  ///
  /// **13/10**
  final ddmm = [dd, '/', mm];

  /// **[HH, ':', nn]**
  ///
  /// **10:59**
  final timeFormat = [HH, ':', nn];

  /// **[D, ', ', dd, '/', mm, '/', yyyy]**
  ///
  /// **Tue, 01/01/2000**
  final Dddmmyyyy = [D, ', ', dd, '/', mm, '/', yyyy];

  /// **[yyyy, '/', mm, '/', dd]**
  ///
  /// **2000/01/01**
  final yyyymmdd = [yyyy, '/', mm, '/', dd];

  /// **[dd, '/', mm, '/', yyyy]**
  ///
  /// **01/01/2000**
  final ddmmyyyy = [dd, '/', mm, '/', yyyy];

  /// **[yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss]**
  ///
  /// **2000-01-01 10:59:59**
  final yyyymmddHHnnss = [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss];

  /// **[HH, ':', nn, ', ', dd, '/', mm, '/', yyyy]**
  ///
  /// **10:59, 01/01/2000**
  final HHnnddmmyyWithCommas = [HH, ':', nn, ', ', dd, '/', mm, '/', yyyy];

  /// **[D, '\n', dd]**
  ///
  /// **Tue**
  ///
  /// **01**
  final DAbovedd = [D, '\n', dd];

  /// **[mm, ' ', yyyy]**
  ///
  /// **01 2000**
  final mmSpaceyyyy = [mm, ' ', yyyy];

  /// **[yyyy, mm, dd, HH, nn, ss]**
  ///
  /// **20001225105959**
  final yyyymmddHHnnssWithoutSeparate = [yyyy, mm, dd, HH, nn, ss];

  /// **[MM]**
  ///
  /// **August**
  final monthNameOnly = [MM];

  /// **[MM,' ',dd]**
  ///
  /// **August**
  final monthNameWithDate = [MM, ' ', dd];

  /// **[D]**
  ///
  /// **Tue**
  final weekDayNameOnly = [D];

  /// **[DD, dd/mm/yyyy]**
  ///
  /// **Tuedays, 04/08/1999**
  final fullWeekAndDate = [DD, ', ', dd, '/', mm, '/', yyyy];
}

extension DateUtilsExtention on DateTime {
  String customFormat(
    List<String> format, {
    DateLocale locale = const EnglishDateLocale(),
  }) {
    return formatDate(
      toLocal(),
      format,
      locale: locale,
    );
  }

  /// **[mm, ' ', yyyy]**
  ///
  /// **01 2000**
  String toLocalmmyyyy() {
    return formatDate(
      toLocal(),
      DateTimeFormat().mmSpaceyyyy,
    );
  }

  /// **[dd, '/', mm, '/', yyyy]**
  ///
  /// **01/01/2000**
  String toLocalddmmyyyy() {
    return formatDate(
      toLocal(),
      DateTimeFormat().ddmmyyyy,
    );
  }

  /// **[dd, '/', mm, '/', yyyy]**
  ///
  /// **01/01/2000**
  String toddmmyyyy() {
    return formatDate(
      this,
      DateTimeFormat().ddmmyyyy,
    );
  }

  /// **[HH, ':', nn, ' - ', dd, '/', mm, '/', yyyy]**
  ///
  /// **10:59 - 01/01/2000**
  String toLocalHHnnddmmyyyy() {
    return formatDate(
      toLocal(),
      DateTimeFormat().HHnnddmmyyyy,
    );
  }

  /// **[HH, ':', nn, ' - ', dd, '/', mm]**
  ///
  /// **10:59 - 01/01**
  String toLocalHHnnddmm() {
    return formatDate(
      toLocal(),
      DateTimeFormat().HHnnddmm,
    );
  }

  /// **[ dd, '/', mm, '/', yyyy, ' ', HH, ':', nn]**
  ///
  /// **01/01/2000 10:59**
  String toLocalddmmyyyyHHnn() {
    return formatDate(
      toLocal(),
      DateTimeFormat().ddmmyyyyHHnn,
    );
  }

  /// **[ dd, '/', mm]**
  ///
  /// **13/10**
  String toLocalddmm() {
    return formatDate(
      toLocal(),
      DateTimeFormat().ddmm,
    );
  }

  /// **[HH, ':', nn, ' - ', dd, '/', mm, '/', yyyy]**
  ///
  /// **10:59 - 01/01/2000**
  String toUTCHHnnddmmyyyy() {
    return formatDate(
      toUtc(),
      DateTimeFormat().HHnnddmmyyyy,
    );
  }

  /// **[yyyy, '/', mm, '/', dd]**
  ///
  /// **2000/01/01**
  String toUTCyyyymmdd() {
    return formatDate(
      toUtc(),
      DateTimeFormat().yyyymmdd,
    );
  }

  /// **[yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss]**
  ///
  /// **2000-01-01 10:59:59**
  String toUTCyyyymmddHHnnss() {
    return formatDate(
      toUtc(),
      DateTimeFormat().yyyymmddHHnnss,
    );
  }

  /// **[HH, ':', nn, ', ', dd, '/', mm, '/', yyyy]**
  ///
  /// **10:59, 01/01/2000**
  String toLocalHHnnddmmyyWithCommas() {
    return formatDate(
      toLocal(),
      DateTimeFormat().HHnnddmmyyWithCommas,
    );
  }

  /// **[yyyy, mm, dd, HH, nn, ss]**
  ///
  /// **20001225105959**
  String toLocalyyyymmddHHnnssWithoutSeparate() {
    return formatDate(
      toLocal(),
      DateTimeFormat().yyyymmddHHnnssWithoutSeparate,
    );
  }

  /// **[HH, ':', nn]**
  ///
  /// **10:59**
  String toTimeFormat() {
    return formatDate(
      toLocal(),
      DateTimeFormat().timeFormat,
    );
  }

  /// **[D, ', ', dd, '/', mm, '/', yyyy]**
  ///
  /// **Tue, 01/01/2000**
  String toLocalDddmmyyyy({
    DateLocale locale = const EnglishDateLocale(),
  }) {
    return formatDate(
      toLocal(),
      DateTimeFormat().Dddmmyyyy,
      locale: locale,
    );
  }

  /// **[D, '\n', dd]**
  ///
  /// **Tue**
  ///
  /// **01**
  String toLocalDAbovedd({
    DateLocale locale = const EnglishDateLocale(),
  }) {
    return formatDate(
      toLocal(),
      DateTimeFormat().DAbovedd,
      locale: locale,
    );
  }

  /// **[D, '\n', dd]**
  ///
  /// **Tue**
  ///
  /// **01**
  String toFullWeekAndDate({
    DateLocale locale = const EnglishDateLocale(),
  }) {
    return formatDate(
      toLocal(),
      DateTimeFormat().fullWeekAndDate,
      locale: locale,
    );
  }

  /// **[m]**
  ///
  /// **August**
  ///
  String toMonthNameOnly({
    DateLocale locale = const EnglishDateLocale(),
  }) {
    return formatDate(
      toLocal(),
      DateTimeFormat().monthNameOnly,
      locale: locale,
    );
  }

  /// **[MM, ' ', dd]**
  ///
  /// **August**
  ///
  String toMonthNameWithDate({
    DateLocale locale = const EnglishDateLocale(),
  }) {
    return formatDate(
      toLocal(),
      DateTimeFormat().monthNameWithDate,
      locale: locale,
    );
  }

  /// **[D]**
  ///
  /// **Tue**
  ///
  String toWeekDayOnly({
    DateLocale locale = const EnglishDateLocale(),
  }) {
    return formatDate(
      toLocal(),
      DateTimeFormat().weekDayNameOnly,
      locale: locale,
    ).substring(0, 3);
  }

  DateTime getDateOnly() {
    return copyWith(
      hour: 0,
      minute: 0,
      second: 0,
      millisecond: 0,
      microsecond: 0,
    );
  }
}
