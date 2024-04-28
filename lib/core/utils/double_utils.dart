import 'package:intl/intl.dart';

extension DoubleUtils on double {
  String toDollar() {
    final oCcy = NumberFormat('#,##0', 'en_US');
    return '${oCcy.format(this)}\$';
  }

  String toVnd() {
    final oCcy = NumberFormat('#,##0', 'vi_VN');
    return '${oCcy.format(this)}đ';
  }
}
