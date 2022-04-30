import 'package:intl/intl.dart';

class UserModel {
  String? id;
  int? nik;
  String? nama;
  int? ktm;
  String? fotoUrl;
  String? username;
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
    this.fotoUrl,
    this.ktm,
    this.username,
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
        fotoUrl: json["fotoUrl"],
        ktm: json["ktm"],
        username: json["username"],
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
        "fotoUrl": fotoUrl,
        "ktm": ktm,
        "username": username,
        "password": password,
        "alamat": alamat,
        "telpon": telpon,
        "saldo": saldo,
        "role": role,
        "token": token,
      };

  @override
  String toString() {
    return 'UserModel{id: $id, nik: $nik, nama: $nama, ktm: $ktm, fotoUrl: $fotoUrl, username: $username, password: $password, alamat: $alamat, telpon: $telpon, saldo: $saldo, role: $role, token: $token}, createdAt: $createdAt}';
  }
}
