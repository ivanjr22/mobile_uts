class Buku {
  //pembuatan atribut pada table book
  int _idBuku;
  String _namaBuku;
  String _kategoriBuku;
  String _penerbitBuku;
  int _tahunBuku;
  int _jumlahBuku;

  Buku(this._kategoriBuku, this._namaBuku, this._penerbitBuku, this._tahunBuku, this._jumlahBuku);
  // konstruktor konversi dari Map ke Item
  Buku.fromMap(Map<String, dynamic> map) {
    this._idBuku = map['idBuku'];
    this._namaBuku = map['namaBuku'];
    this._kategoriBuku = map['kategoriBuku'];
    this._penerbitBuku = map['penerbitBuku'];
    this._tahunBuku = map['tahunBuku'];
    this._jumlahBuku = map['jumlahBuku'];
  }
  // pembuatan setter getter
  int get idBuku => _idBuku;

  String get namaBuku => this._namaBuku;
  set namaBuku(String value) => this._namaBuku = value;

  String get kategoriBuku => this._kategoriBuku;
  set kategoriBuku(String value) => this._kategoriBuku = value;
  
  String get penerbitBuku => this._penerbitBuku;
  set penerbitBuku(String value) => this._penerbitBuku = value;

  get tahunBuku => this._tahunBuku;
  set tahunBuku(value) => this._tahunBuku = value;

  get jumlahBuku => this._jumlahBuku;
  set jumlahBuku(value) => this._jumlahBuku = value;
  //memasukkan getter setter ke dalam Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['idBuku'] = this._idBuku;
    map['namaBuku'] = namaBuku;
    map['kategoriBuku'] = kategoriBuku;
    map['penerbitBuku'] = penerbitBuku;
    map['tahunBuku'] = tahunBuku;
    map['jumlahBuku'] = jumlahBuku;
    return map;
  }
}
