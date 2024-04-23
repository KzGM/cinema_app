import 'package:intl/intl.dart';

extension IntUtil on int {
  String addCommas() {
    final oCcy = NumberFormat('#,##0', 'en_US');
    return oCcy.format(this);
  }
}
