import 'dart:io';

import 'package:intl/intl.dart';

class SembakoModel {
  String? id;
  String? nama;
  String? fotoUrl;
  int? harga;
  int? stok;

  /// base64
  File? file;

  SembakoModel({
    this.id,
    this.nama,
    this.fotoUrl,
    this.file,
    this.harga,
    this.stok,
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
        nama: json["nama"],
        fotoUrl: json["fotoUrl"],
        harga: json["harga"],
        stok: json["stok"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "fotoUrl": fotoUrl,
        "harga": harga,
        "stok": stok,
      };
}
