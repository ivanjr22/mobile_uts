import 'package:mobile_uts/pages/home.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mobile_uts/model/item.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';

class DbHelper {

  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();

  Future<Database> initDb() async {

    //untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'stokatk.db';

    //create, read databases
    var stokatDatabase = openDatabase(
      path, version: 8, 
      onCreate: _createDb,
      onUpgrade: _onUpgrade
    );

    //mengembalikan nilai object sebagai hasil dari fungsinya
    return stokatDatabase;
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    _createDb(db, newVersion);
  }

  //buat tabel baru dengan nama item
  void _createDb(Database db, int version) async {
    await db.execute
    ('''
      CREATE TABLE buku 
      (
        idbuku INTEGER PRIMARY KEY AUTOINCREMENT,
        judulbuku TEXT,
        penerbit TEXT,
        harga INTEGER,
        stok INTEGER,
        tahunterbit INTEGER,
      )
    ''');
  }

  //select databases
  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.initDb();
    var mapList = await db.query(
      'barang', 
      orderBy: 'kodeBrg'
    );
    return mapList;
  }

  //create databases
  Future<int> insert(Buku object) async {
    Database db = await this.initDb();
    int count = await db.insert(
      'barang', 
      object.toMap()
    );
    return count;
  }

  //update databases
  Future<int> update(Buku object) async {
    Database db = await this.initDb();
    int count = await db.update(
      'barang', 
      object.toMap(), 
      where: 'id=?', 
      whereArgs: [object.id]
    );
    return count;
  }

  //delete databases
  Future<int> delete(Buku object) async {
    Database db = await this.initDb();
    int count = await db.delete(
      'barang', 
      where: 'id=?', 
      whereArgs: [object.id]
    );
    return count;
  }

  Future<List<Buku>> getBarangList() async {
    var bukuMapList = await select();
    int count = bukuMapList.length;
    // ignore: deprecated_member_use
    List<Buku> itemList = List<Buku>();
    for (int i = 0; i < count; i++) {
      itemList.add(
        Buku.fromMap(
          bukuMapList[i]
        )
      );
    }
    return itemList;
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