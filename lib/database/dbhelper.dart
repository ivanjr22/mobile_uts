import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mobile_uts/model/buku.dart';
import 'package:mobile_uts/model/stok.dart';
import 'dart:async';
import 'dart:io';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();
  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'tokobuku.db';

    var tokobukuDatabase =
        openDatabase(path, version: 9, onCreate: _createDb);
    return tokobukuDatabase;
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    _createDb(db, newVersion);
  }

  void _createDb(Database db, int version) async {
    var batch = db.batch();
    batch.execute('DROP TABLE IF EXISTS buku');
    batch.execute('DROP TABLE IF EXISTS stok');
    batch.execute('''
 CREATE TABLE buku (
 idBuku INTEGER PRIMARY KEY AUTOINCREMENT,
  namaBuku TEXT,
  kategoriBuku TEXT,
  penerbitBuku TEXT,
  tahunBuku INTEGER
 )
 ''');
    batch.execute('''
 CREATE TABLE stok (
 idStok INTEGER PRIMARY KEY AUTOINCREMENT,
  namaStok TEXT,
  kategoriStok TEXT,
  penerbitStok TEXT,
  tahunStok INTEGER,
  stokStok INTEGER
 )
 ''');
    await batch.commit();
  }

  Future<List<Map<String, dynamic>>> selectBuku() async {
    Database db = await this.initDb();
    var mapList = await db.query('buku', orderBy: 'namaBuku');
    return mapList;
  }

  Future<List<Map<String, dynamic>>> selectStok() async {
    Database db = await this.initDb();
    var mapList = await db.query('stok', orderBy: 'namaStok');
    return mapList;
  }

  Future<int> insertBuku(Buku object) async {
    Database db = await this.initDb();
    int count = await db.insert('buku', object.toMap());
    return count;
  }

  Future<int> insertStok(Stok object) async {
    Database db = await this.initDb();
    int count = await db.insert('stok', object.toMap());
    return count;
  }

  Future<int> updateBuku(Buku object) async {
    Database db = await this.initDb();
    int count = await db.update('buku', object.toMap(),
        where: 'idBuku=?', whereArgs: [object.idBuku]);
    return count;
  }

  Future<int> updateStok(Stok object) async {
    Database db = await this.initDb();
    int count = await db.update('stok', object.toMap(),
        where: 'idStok=?', whereArgs: [object.idStok]);
    return count;
  }

  Future<int> deleteBuku(int idBuku) async {
    Database db = await this.initDb();
    int count = await db.delete('buku', where: 'idBuku=?', whereArgs: [idBuku]);
    return count;
  }

  Future<int> deleteStok(int idStok) async {
    Database db = await this.initDb();
    int count = await db.delete('stok', where: 'idStok=?', whereArgs: [idStok]);
    return count;
  }

  Future<List<Buku>> getBukuList() async {
    var bukuMapList = await selectBuku();
    int count = bukuMapList.length;
    List<Buku> bukuList = List<Buku>();
    for (int i = 0; i < count; i++) {
      bukuList.add(Buku.fromMap(bukuMapList[i]));
    }
    return bukuList;
  }

  Future<List<Stok>> getStokList() async {
    var stokMapList = await selectStok();
    int count = stokMapList.length;
    List<Stok> stokList = List<Stok>();
    for (int i = 0; i < count; i++) {
      stokList.add(Stok.fromMap(stokMapList[i]));
    }
    return stokList;
  }

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }
}
