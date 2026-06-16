import 'dart:io';
import 'sistem_kasela.dart';

void main() {
  SistemKasela sistem = SistemKasela();

  int pilihan;

  do {
    print("\n<-- SISTEM PENGELOLAAN STOK DAN PENJUALAN");
    print("KOPI BUBUK KASELA GOMBENGSARI -->");
    print("1. Kelola Produk");
    print("2. Penjualan Produk");
    print("3. Riwayat Penjualan");
    print("0. Keluar");

    stdout.write("Pilih menu: ");
    pilihan = int.parse(stdin.readLineSync()!);

    switch (pilihan) {
      case 1:
        int subMenu;

        do {
          print("\n<-- KELOLA PRODUK -->");
          print("1. Tampilkan Produk");
          print("2. Tambah Produk");
          print("3. Tambah Stok");
          print("4. Cari Produk");
          print("5. Urutkan Berdasarkan Stok");
          print("0. Kembali");

          stdout.write("Pilih: ");
          subMenu = int.parse(stdin.readLineSync()!);

          switch (subMenu) {
            case 1:
              sistem.tampilProduk();
              break;

            case 2:
              sistem.tambahProduk();
              break;

            case 3:
              sistem.tambahStokProduk();
              break;

            case 4:
              sistem.cariProduk();
              break;

            case 5:
              sistem.urutkanStok();
              break;
          }
        } while (subMenu != 0);

        break;

      case 2:
        sistem.penjualanProduk();
        break;

      case 3:
        sistem.tampilRiwayat();
        sistem.transaksiTerakhir();
        break;

      case 0:
        print("Program selesai.");
        break;
    }
  } while (pilihan != 0);
}
