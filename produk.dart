abstract class DataInfo {
  void tampilkanInfo();
}

abstract class ProdukDasar {
  void tambahStok(int jumlah);
}

class Produk implements DataInfo, ProdukDasar {
  int _id;
  String _nama;
  int _stok;
  double _harga;

  Produk(this._id, this._nama, this._stok, this._harga);

  int get id => _id;
  String get nama => _nama;
  int get stok => _stok;
  double get harga => _harga;

  @override
  void tambahStok(int jumlah) {
    _stok += jumlah;
  }

  void kurangiStok(int jumlah) {
    _stok -= jumlah;
  }

  @override
  void tampilkanInfo() {
    print(
      "$_id | $_nama | Stok: $_stok | Harga: Rp ${_harga.toStringAsFixed(0)}",
    );
  }
}

class ProdukKopi extends Produk {
  ProdukKopi(int id, String nama, int stok, double harga)
    : super(id, nama, stok, harga);

  @override
  void tampilkanInfo() {
    print("$id | $nama | Stok: $stok | Harga: Rp ${harga.toStringAsFixed(0)}");
  }
}
