import 'dart:io';

import 'package:intl/intl.dart';

class SembakoModel {
  String? id;
  String? agen;
  String? nama;
  String? fotoUrl;
  int? harga;
  int? stok;
  File? file;

  SembakoModel({
    this.id,
    this.agen,
    this.nama,
    this.fotoUrl,
    this.harga,
    this.stok,
    this.file,
  });

  String get hargaFormat {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp. ',
      decimalDigits: 0,
    );
    return currencyFormatter.format(harga);
  }

  factory SembakoModel.fromJson(Map<String, dynamic> json) => SembakoModel(
        id: json["id"] ?? json["_id"],
        agen: json["agen"],
        nama: json["nama"],
        fotoUrl: json["fotoUrl"],
        harga: json["harga"],
        stok: json["stok"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "agen": agen,
        "nama": nama,
        "fotoUrl": fotoUrl,
        "harga": harga,
        "stok": stok,
      };
}
