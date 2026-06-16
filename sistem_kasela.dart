import 'dart:io';
import 'produk.dart';
import 'transaksi.dart';

class SistemKasela {
  List<Produk> daftarProduk = [];

  List<Transaksi> riwayatPenjualan = [];

  List<Transaksi> stackTransaksi = [];

  SistemKasela() {
    daftarProduk.add(ProdukKopi(1, "Kopi Robusta", 20, 50000));

    daftarProduk.add(ProdukKopi(2, "Kopi Arabika", 15, 75000));

    daftarProduk.add(ProdukKopi(3, "Kopi Lanang", 10, 50000));

    daftarProduk.add(ProdukKopi(4, "Kopi Excelsa", 5, 50000));

    daftarProduk.add(ProdukKopi(5, "Kopi Luwak Arabika", 8, 220000));

    daftarProduk.add(ProdukKopi(6, "Kopi Luwak Robusta", 12, 170000));

    daftarProduk.add(ProdukKopi(7, "Kopi Konaga", 18, 40000));
  }

  void tampilProduk() {
    for (var produk in daftarProduk) {
      produk.tampilkanInfo();
    }
  }

  void tambahProduk() {
    stdout.write("ID Produk : ");
    int id = int.parse(stdin.readLineSync()!);

    stdout.write("Nama Produk : ");
    String nama = stdin.readLineSync()!;

    stdout.write("Stok : ");
    int stok = int.parse(stdin.readLineSync()!);

    stdout.write("Harga : ");
    double harga = double.parse(stdin.readLineSync()!);

    daftarProduk.add(ProdukKopi(id, nama, stok, harga));

    print("Produk berhasil ditambahkan.");
  }

  void tambahStokProduk() {
    stdout.write("Masukkan nama produk: ");
    String cari = stdin.readLineSync()!;

    for (var produk in daftarProduk) {
      if (produk.nama.toLowerCase().contains(cari.toLowerCase())) {
        stdout.write("Jumlah stok tambahan: ");
        int tambah = int.parse(stdin.readLineSync()!);

        produk.tambahStok(tambah);

        print("Stok berhasil ditambahkan.");
        return;
      }
    }

    print("Produk tidak ditemukan.");
  }

  void cariProduk() {
    stdout.write("Cari nama produk: ");
    String keyword = stdin.readLineSync()!;

    bool ditemukan = false;

    for (var produk in daftarProduk) {
      if (produk.nama.toLowerCase().contains(keyword.toLowerCase())) {
        produk.tampilkanInfo();
        ditemukan = true;
      }
    }

    if (!ditemukan) {
      print("Produk tidak ditemukan.");
    }
  }

  void urutkanStok() {
    daftarProduk.sort((a, b) => b.stok.compareTo(a.stok));

    print("Data berhasil diurutkan berdasarkan stok terbesar.");
    tampilProduk();
  }

  void penjualanProduk() {
    stdout.write("Nama produk: ");
    String nama = stdin.readLineSync()!;

    Produk? produkDipilih;

    for (var produk in daftarProduk) {
      if (produk.nama.toLowerCase().contains(nama.toLowerCase())) {
        produkDipilih = produk;
      }
    }

    if (produkDipilih == null) {
      print("Produk tidak ditemukan.");
      return;
    }

    stdout.write("Jumlah beli: ");
    int jumlah = int.parse(stdin.readLineSync()!);

    if (jumlah > produkDipilih.stok) {
      print("Stok tidak mencukupi.");
      return;
    }

    produkDipilih.kurangiStok(jumlah);

    double total = jumlah * produkDipilih.harga;

    Transaksi transaksi = Transaksi(produkDipilih.nama, jumlah, total);

    riwayatPenjualan.add(transaksi);

    stackTransaksi.add(transaksi);

    print("Penjualan berhasil.");
    print("Total bayar : Rp ${total.toStringAsFixed(0)}");
  }

  void tampilRiwayat() {
    if (riwayatPenjualan.isEmpty) {
      print("Belum ada transaksi.");
      return;
    }

    double totalPendapatan = 0;

    for (var transaksi in riwayatPenjualan) {
      transaksi.tampilkanInfo();
      totalPendapatan += transaksi.total;
    }

    print("\n--------------------");
    print("TOTAL PENJUALAN");
    print("--------------------");
    print("Jumlah Transaksi : ${riwayatPenjualan.length}");
    print("Total Pendapatan : Rp ${totalPendapatan.toStringAsFixed(0)}");
  }

  void transaksiTerakhir() {
    if (stackTransaksi.isEmpty) {
      print("Belum ada transaksi.");
      return;
    }

    print("\nTransaksi Terakhir");
    stackTransaksi.last.tampilkanInfo();
  }
}
