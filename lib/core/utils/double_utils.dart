import 'package:intl/intl.dart';

extension DoubleUtils on double {
  String toDollar() {
    final oCcy = NumberFormat('#,##0', 'en_US');
    return '${oCcy.format(this)}\$';
  }
}
