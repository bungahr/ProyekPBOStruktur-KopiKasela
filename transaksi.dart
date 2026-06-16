import 'produk.dart';

class Transaksi implements DataInfo {
  String namaProduk;
  int jumlah;
  double total;

  Transaksi(this.namaProduk, this.jumlah, this.total);

  @override
  void tampilkanInfo() {
    print(
      "Produk: $namaProduk | Jumlah: $jumlah | Total: Rp ${total.toStringAsFixed(0)}",
    );
  }
}
