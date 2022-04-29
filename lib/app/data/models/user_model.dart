import 'package:intl/intl.dart';

class UserModel {
  String? id;
  int? nik;
  String? nama;
  int? ktm;
  String? foto;
  String? username;
  String? password;
  String? alamat;
  String? telpon;
  String? role;
  String? token;
  String? createdAt;

  UserModel({
    this.id,
    this.nik,
    this.nama,
    this.foto,
    this.ktm,
    this.username,
    this.password,
    this.alamat,
    this.telpon,
    this.role,
    this.token,
    this.createdAt,
  });

  String get tanggal {
    return DateFormat('dd-MM-yyyy').format(DateTime.parse(createdAt!));
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"] ?? json["_id"],
        nik: json["nik"],
        nama: json["nama"],
        foto: json["foto"],
        ktm: json["ktm"],
        username: json["username"],
        password: json["password"],
        alamat: json["alamat"],
        telpon: json["telpon"],
        role: json["role"],
        token: json["token"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nik": nik,
        "nama": nama,
        "foto": foto,
        "ktm": ktm,
        "username": username,
        "password": password,
        "alamat": alamat,
        "telpon": telpon,
        "role": role,
        "token": token,
      };

  @override
  String toString() {
    return 'UserModel{id: $id, nik: $nik, nama: $nama, ktm: $ktm, foto: $foto, username: $username, password: $password, alamat: $alamat, telpon: $telpon, role: $role, token: $token}, createdAt: $createdAt}';
  }
}
