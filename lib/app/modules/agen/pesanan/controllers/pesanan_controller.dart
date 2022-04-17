import 'package:e_warong/app/data/models/pesanan_model.dart';
import 'package:e_warong/app/data/models/sembako_model.dart';
import 'package:e_warong/app/data/models/user_model.dart';
import 'package:get/get.dart';

class PesananController extends GetxController {
  RxList<PesananModel> pesananList = <PesananModel>[].obs;

  List<PesananModel> get pesananMasuk =>
      pesananList.where((pesanan) => pesanan.status == null).toList();

  List<PesananModel> get pesananDitolak =>
      pesananList.where((pesanan) => pesanan.status == false).toList();

  List<PesananModel> get pesananDiterima =>
      pesananList.where((pesanan) => pesanan.status == true).toList();

  List<PesananModel> get pesananSelesai =>
      pesananList.where((pesanan) => pesanan.selesai == true).toList();

  @override
  void onInit() {
    pesananList.addAll([
      PesananModel(
        id: "1",
        user: UserModel(nama: "rahman", ktm: "123456789"),
        sembako: SembakoModel(
          id: "1",
          nama: "Terigu Karung 25KG",
          jenis: JenisSembako.beras,
          harga: 10000,
          stok: 5,
        ),
        jumlah: 4,
        createdAt: DateTime.now(),
      ),
      PesananModel(
        id: "1",
        user: UserModel(nama: "rahman", ktm: "123456789"),
        sembako: SembakoModel(
          id: "1",
          nama: "Terigu Karung 25KG",
          jenis: JenisSembako.beras,
          harga: 10000,
          stok: 5,
        ),
        jumlah: 4,
        createdAt: DateTime.now(),
      ),
    ]);
    super.onInit();
  }

  void addDumpPesanan() {
    pesananList.add(
      PesananModel(
        id: "1",
        user: UserModel(nama: "rahman", ktm: "123456789"),
        sembako: SembakoModel(
          id: "1",
          nama: "Terigu Karung 25KG",
          jenis: JenisSembako.beras,
          harga: 10000,
          stok: 5,
        ),
        jumlah: 4,
        status: true,
        createdAt: DateTime.now(),
      ),
    );
  }

  @override
  void onClose() {}
}
