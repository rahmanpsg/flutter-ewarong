import 'package:intl/intl.dart';

class UserModel {
  String? id;
  int? nik;
  String? nama;
  String? namaToko;
  int? kpm;
  String? fotoUrl;
  String? kode;
  String? password;
  String? alamat;
  String? telpon;
  int? saldo;
  String? role;
  String? token;
  String? createdAt;

  UserModel({
    this.id,
    this.nik,
    this.nama,
    this.namaToko,
    this.fotoUrl,
    this.kpm,
    this.kode,
    this.password,
    this.alamat,
    this.telpon,
    this.saldo,
    this.role,
    this.token,
    this.createdAt,
  });

  String get tanggal {
    return DateFormat('dd-MM-yyyy').format(DateTime.parse(createdAt!));
  }

  String get saldoFormat {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp. ',
      decimalDigits: 0,
    );
    return currencyFormatter.format(saldo);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"] ?? json["_id"],
        nik: json["nik"],
        nama: json["nama"],
        namaToko: json["namaToko"],
        fotoUrl: json["fotoUrl"],
        kpm: json["kpm"],
        kode: json["kode"],
        password: json["password"],
        alamat: json["alamat"],
        telpon: json["telpon"],
        saldo: json["saldo"],
        role: json["role"],
        token: json["token"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nik": nik,
        "nama": nama,
        "namaToko": namaToko,
        "fotoUrl": fotoUrl,
        "kpm": kpm,
        "kode": kode,
        "password": password,
        "alamat": alamat,
        "telpon": telpon,
        "saldo": saldo,
        "role": role,
        "token": token,
      };

  @override
  String toString() {
    return 'UserModel{id: $id, nik: $nik, nama: $nama, namaToko: $namaToko, kpm: $kpm, fotoUrl: $fotoUrl, kode: $kode, password: $password, alamat: $alamat, telpon: $telpon, saldo: $saldo, role: $role, token: $token}, createdAt: $createdAt}';
  }
}
