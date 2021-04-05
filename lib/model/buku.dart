class Buku {
  int _idBuku;
  String _namaBuku;
  String _kategoriBuku;
  String _penerbitBuku;
  int _tahunBuku;

  Buku(this._namaBuku, this._penerbitBuku, this._tahunBuku);
  Buku.fromMap(Map<String, dynamic> map) {
    this._idBuku = map['idBuku'];
    this._namaBuku = map['namaBuku'];
    this._penerbitBuku = map['penerbitBuku'];
    this._tahunBuku = map['tahunBuku'];
  }
  int get idBuku => _idBuku;
  //getter and setter
  String get namaBuku => this._namaBuku;
  set namaBuku(String value) => this._namaBuku = value;
  //getter and setter
  String get penerbitBuku => this._penerbitBuku;
  set penerbitBuku(String value) => this._penerbitBuku = value;
  //getter and setter
  get tahunBuku => this._tahunBuku;
  set tahunBuku(value) => this._tahunBuku = value;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['idBuku'] = this._idBuku;
    map['namaBuku'] = namaBuku;
    map['penerbitBuku'] = penerbitBuku;
    map['tahunBuku'] = tahunBuku;
    return map;
  }
}
