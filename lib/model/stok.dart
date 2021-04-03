class Stok {
  int _idBuku;
  String _namaBuku;
  String _kategoriBuku;
  String _penerbitBuku;
  int _tahunBuku;
  int _stokBuku;

  Stok(this._kategoriBuku, this._namaBuku, this._penerbitBuku, this._tahunBuku, this._stokBuku);
  Stok.fromMap(Map<String, dynamic> map) {
    this._idBuku = map['idBuku'];
    this._namaBuku = map['namaBuku'];
    this._kategoriBuku = map['kategoriBuku'];
    this._penerbitBuku = map['penerbitBuku'];
    this._tahunBuku = map['tahunBuku'];
    this._stokBuku = map ['stokBuku'];
  }
  int get idBuku => _idBuku;

  String get namaBuku => this._namaBuku;
  set namaBuku(String value) => this._namaBuku = value;

  String get kategoriBuku => this._kategoriBuku;
  set kategoriBuku(String value) => this._kategoriBuku = value;
  
  String get penerbitBuku => this._penerbitBuku;
  set penerbitBuku(String value) => this._penerbitBuku = value;

  get tahunBuku => this._tahunBuku;
  set tahunBuku(value) => this._tahunBuku = value;

  get stokBuku => this._stokBuku;
  set stokBuku(value) => this._stokBuku = value;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['idBuku'] = this._idBuku;
    map['namaBuku'] = namaBuku;
    map['kategoriBuku'] = kategoriBuku;
    map['penerbitBuku'] = penerbitBuku;
    map['tahunBuku'] = tahunBuku;
    map['stokBuku'] = stokBuku;
    return map;
  }
}
