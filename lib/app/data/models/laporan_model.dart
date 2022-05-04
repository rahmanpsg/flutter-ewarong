import 'package:intl/intl.dart';

import 'sembako_model.dart';

class LaporanModel {
  List<LaporanSembakosModel>? sembakos;
  int bulan;
  int tahun;
  int total;
  int pendapatan;

  LaporanModel({
    required this.sembakos,
    required this.bulan,
    required this.tahun,
    required this.total,
    required this.pendapatan,
  });

  String get pendapatanFormat {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp. ',
      decimalDigits: 0,
    );
    return currencyFormatter.format(pendapatan);
  }

  factory LaporanModel.fromJson(Map<String, dynamic> json) => LaporanModel(
        sembakos: json["sembakos"] == null
            ? null
            : List<LaporanSembakosModel>.from(
                json["sembakos"].map((x) => LaporanSembakosModel.fromJson(x)),
              ),
        bulan: json["bulan"],
        tahun: json["tahun"],
        total: json["total"],
        pendapatan: json["pendapatan"],
      );
}

class LaporanSembakosModel {
  SembakoModel? sembako;
  int jumlah;

  LaporanSembakosModel({
    required this.sembako,
    required this.jumlah,
  });

  factory LaporanSembakosModel.fromJson(Map<String, dynamic> json) =>
      LaporanSembakosModel(
        sembako: json["sembako"] == null || json["sembako"] is String
            ? null
            : SembakoModel.fromJson(json["sembako"]),
        jumlah: json["jumlah"],
      );
}
