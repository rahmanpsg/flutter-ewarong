class TokoModel {
  String? id;
  String? namaToko;
  String? alamat;

  TokoModel({
    this.id,
    this.namaToko,
    this.alamat,
  });

  factory TokoModel.fromJson(Map<String, dynamic> json) => TokoModel(
        id: json["id"] ?? json["_id"],
        namaToko: json["namaToko"],
        alamat: json["alamat"],
      );

  @override
  String toString() {
    return 'TokoModel{id: $id, namaToko: $namaToko, alamat: $alamat}';
  }
}
