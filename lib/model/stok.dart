class Stok {
  int _idStok;
  String _namaStok;
  String _kategoriStok;
  String _penerbitStok;
  int _tahunStok;
  int _stokStok;

  Stok(this._namaStok, this._kategoriStok, this._penerbitStok, this._tahunStok, this._stokStok);
  Stok.fromMap(Map<String, dynamic> map) {
    this._idStok = map['idStok'];
    this._namaStok = map['namaStok'];
    this._kategoriStok = map['kategoriStok'];
    this._penerbitStok = map['penerbitStok'];
    this._tahunStok = map['tahunStok'];
    this._stokStok = map ['stokStok'];
  }
  int get idStok => _idStok;

  String get namaStok => this._namaStok;
  set namaStok(String value) => this._namaStok = value;

  String get kategoriStok => this._kategoriStok;
  set kategoriStok(String value) => this._kategoriStok = value;
  
  String get penerbitStok => this._penerbitStok;
  set penerbitStok(String value) => this._penerbitStok = value;

  get tahunStok => this._tahunStok;
  set tahunStok(value) => this._tahunStok = value;

  get stokStok => this._stokStok;
  set stokStok(value) => this._stokStok = value;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['idStok'] = this._idStok;
    map['namaStok'] = namaStok;
    map['kategoriStok'] = kategoriStok;
    map['penerbitStok'] = penerbitStok;
    map['tahunStok'] = tahunStok;
    map['stokStok'] = stokStok;
    return map;
  }
}