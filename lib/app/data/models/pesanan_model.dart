import 'package:e_warong/app/data/models/sembako_model.dart';
import 'package:e_warong/app/data/models/user_model.dart';
import 'package:intl/intl.dart';

class PesananModel {
  String? id;
  UserModel? agen;
  UserModel? masyarakat;
  SembakoModel? sembako;
  int? jumlah;
  bool? status;
  bool? selesai;
  DateTime? createdAt;

  PesananModel({
    this.id,
    this.agen,
    this.masyarakat,
    this.sembako,
    this.jumlah,
    this.status,
    this.selesai,
    this.createdAt,
  });

  String waktuPesanan() {
    DateFormat dateFormat = DateFormat("dd MMMM yyyy HH:mm");

    return dateFormat.format(createdAt!);
  }

  String totalHarga() {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp. ',
      decimalDigits: 0,
    );
    return currencyFormatter.format(sembako!.harga! * jumlah!);
  }

  String get statusPesanan {
    if (selesai == true) {
      return "Selesai";
    } else if (status == true) {
      return "Menunggu konfirmasi dari pembeli";
    } else if (status == false) {
      return "Ditolak";
    } else {
      return "";
    }
  }

  factory PesananModel.fromJson(Map<String, dynamic> json) => PesananModel(
        id: json["id"] ?? json["_id"],
        // agen: UserModel.fromJson(json["agen"]),
        masyarakat: json["masyarakat"] == null || json["masyarakat"] is String
            ? null
            : UserModel.fromJson(json["masyarakat"]),

        sembako: json["sembako"] == null || json["masyarakat"] is String
            ? null
            : SembakoModel.fromJson(json["sembako"]),
        jumlah: json["jumlah"],
        status: json["status"],
        selesai: json["selesai"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "agen": agen?.id,
        "masyarakat": masyarakat?.id,
        "sembako": sembako?.id,
        "jumlah": jumlah,
        "status": status,
        "selesai": selesai,
      };
}
