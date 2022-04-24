import 'package:intl/intl.dart';

class SembakoModel {
  String? id;
  String? nama;
  String? foto;
  int? harga;
  int? stok;

  SembakoModel({
    this.id,
    this.nama,
    this.foto,
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
        foto: json["foto"],
        harga: json["harga"],
        stok: json["stok"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "foto": foto,
        "harga": harga,
        "stok": stok,
      };
}
