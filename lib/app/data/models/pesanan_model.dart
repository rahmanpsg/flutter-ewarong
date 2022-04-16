import 'package:e_warong/app/data/models/sembako_model.dart';
import 'package:e_warong/app/data/models/user_model.dart';
import 'package:intl/intl.dart';

class PesananModel {
  String? id;
  UserModel? user;
  SembakoModel? sembako;
  int? jumlah;
  bool? status;
  DateTime? createdAt;

  PesananModel({
    this.id,
    this.user,
    this.sembako,
    this.jumlah,
    this.status,
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
    return currencyFormatter.format(int.parse(sembako!.harga) * jumlah!);
  }
}