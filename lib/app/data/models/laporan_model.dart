import 'package:intl/intl.dart';

class LaporanModel {
  String? id;
  int? bulan;
  int? total;
  int? pendapatan;

  LaporanModel({
    this.id,
    this.bulan,
    this.total,
    this.pendapatan,
  });

  String get getTotal => total.toString();

  String getPendapatan() {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp. ',
      decimalDigits: 0,
    );
    return currencyFormatter.format(pendapatan);
  }
}
