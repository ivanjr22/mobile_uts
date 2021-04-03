class Buku {
  //pembuatan atribut pada table book
  int _idBuku;
  String _kategoriBuku;
  String _namaBuku;
  String _penerbitBuku;
  int _tahun;
  int _jumlahBuku;

  Buku(this._kategoriBuku, this._namaBuku, this._penerbitBuku, this._tahun, this._jumlahBuku);
  // konstruktor konversi dari Map ke Item
  Buku.fromMap(Map<String, dynamic> map) {
    this._idBuku = map['idBuku'];
    this._kategoriBuku = map['kategoriBuku'];
    this._namaBuku = map['namaBuku'];
    this._penerbitBuku = map['penerbitBuku'];
    this._tahun = map['tahun'];
    this._jumlahBuku = map['jumlahBuku'];
  }
  // pembuatan setter getter
  int get idBuku => _idBuku;

  String get kategoriBuku => this._kategoriBuku;
  set kategoriBuku(String value) => this._kategoriBuku = value;

  String get namaBuku => this._namaBuku;
  set namaBuku(String value) => this._namaBuku = value;

  String get penerbitBuku => this._penerbitBuku;
  set penerbitBuku(String value) => this._penerbitBuku = value;

  get tahun => this._tahun;
  set tahun(value) => this._tahun = value;

  get jumlahBuku => this._jumlahBuku;
  set jumlahBuku(value) => this._jumlahBuku = value;
  //memasukkan getter setter ke dalam Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['idBuku'] = this._idBuku;
    map['kategoriBuku'] = kategoriBuku;
    map['namaBuku'] = namaBuku;
    map['penerbitBuku'] = penerbitBuku;
    map['tahun'] = tahun;
    map['jumlahBuku'] = jumlahBuku;
    return map;
  }
}
