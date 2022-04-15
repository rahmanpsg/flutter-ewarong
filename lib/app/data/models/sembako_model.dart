import 'package:intl/intl.dart';

enum JenisSembako {
  beras,
  gulas,
  minyakDanMentega,
  daging,
  telur,
  susu,
  bawang,
  gasDanMinyakTanah,
  garam,
}

class SembakoModel {
  String _id;
  String _nama;
  JenisSembako _jenis;
  String? _foto;
  int _harga;
  int _stok;

  SembakoModel({
    String id = "",
    String nama = "",
    JenisSembako jenis = JenisSembako.beras,
    String? foto,
    int harga = 0,
    int stok = 0,
  })  : _id = id,
        _nama = nama,
        _jenis = jenis,
        _foto = foto,
        _harga = harga,
        _stok = stok;

  String get id => _id;
  String get nama => _nama;
  JenisSembako get jenis => _jenis;
  String? get foto => _foto;
  String get harga => _harga.toString();
  String get stok => _stok.toString();

  String getFormatHarga() {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp. ',
      decimalDigits: 0,
    );
    return currencyFormatter.format(_harga);
  }

  void setId(String id) {
    _id = id;
  }

  void setNama(String nama) {
    _nama = nama;
  }

  void setJenis(JenisSembako jenis) {
    _jenis = jenis;
  }

  void setFoto(String? foto) {
    _foto = foto;
  }

  void setHarga(int harga) {
    _harga = harga;
  }

  void setStok(int stok) {
    _stok = stok;
  }
}
