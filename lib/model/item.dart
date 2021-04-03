class Item {
  int _idbuku;
  String _judulbuku;
  String _penerbit;
  int _harga;
  int _stok;
  int _tahunterbit;

  get idbuku => this._idbuku;
  set idbuku( value) => this._idbuku = value;

  get judulbuku => this._judulbuku;
  set judulbuku(value) => this._judulbuku = value;

  get penerbit => this._penerbit;
  set penerbit(value) => this._penerbit = value;

  get harga => this._harga;
  set harga(value) => this._harga = value;

  get stok => this._stok;
  set stok(value) => this._stok = value;

  get tahunterbit => this._tahunterbit;
  set tahunterbit(value) => this._tahunterbit = value;

// konstruktor versi 1
  Item(this._judulbuku,this._penerbit, this._harga, this._stok, this._tahunterbit);

// konstruktor versi 2: konversi dari Map ke Item
  Item.fromMap(Map<String, dynamic> map) {
    this._idbuku = map['idbuku'];
    this._judulbuku = map['judulbuku'];
    this._penerbit = map['penerbit'];
    this._harga = map['harga'];
    this._stok = map['stok'];
    this._tahunterbit = map['tahunterbit'];
  }
// konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['idbuku'] = this._idbuku;
    map['judulbuku'] = judulbuku;
    map['penerbit'] = penerbit;
    map['harga'] = harga;
    map['stok'] = stok;
    map['tahunterbit'] = tahunterbit;
    return map;
  }
}