import 'package:mobile_uts/pages/homeBuku.dart';
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
        openDatabase(path, version: 10, onCreate: _createDb);
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
  kategoriBuku TEXT,
  namaBuku TEXT,
  penerbitBuku TEXT,
  penulisBuku TEXT,
  jumlahBuku INTEGER
 )
 ''');
    batch.execute('''
 CREATE TABLE anggota (
 idAnggota INTEGER PRIMARY KEY AUTOINCREMENT,
  namaAnggota TEXT,
  jenisAnggota TEXT,
  alamatAnggota TEXT,
  nik INTEGER,
  umur INTEGER
 )
 ''');
    await batch.commit();
  }

  //fungsi untuk select database
  Future<List<Map<String, dynamic>>> selectBook() async {
    Database db = await this.initDb();
    var mapList = await db.query('book', orderBy: 'namaBuku');
    return mapList;
  }

  Future<List<Map<String, dynamic>>> selectAnggota() async {
    Database db = await this.initDb();
    var mapList = await db.query('anggota', orderBy: 'namaAnggota');
    return mapList;
  }

  //fungsi untuk mengisi data pada tabel book
  Future<int> insertBook(Book object) async {
    Database db = await this.initDb();
    int count = await db.insert('book', object.toMap());
    return count;
  }

  //fungsi untuk mengisi data pada tabel anggota
  Future<int> insertAnggota(Anggota object) async {
    Database db = await this.initDb();
    int count = await db.insert('anggota', object.toMap());
    return count;
  }

  //fungsi untuk update data tabel book
  Future<int> updateBook(Book object) async {
    Database db = await this.initDb();
    int count = await db.update('book', object.toMap(),
        where: 'idBuku=?', whereArgs: [object.idBuku]);
    return count;
  }

  //fungsi untuk update tabel anggota
  Future<int> updateAnggota(Anggota object) async {
    Database db = await this.initDb();
    int count = await db.update('anggota', object.toMap(),
        where: 'idAnggota=?', whereArgs: [object.idAnggota]);
    return count;
  }
  //fungsi untuk menghapus data tabel book

  Future<int> deleteBook(int idBuku) async {
    Database db = await this.initDb();
    int count = await db.delete('book', where: 'idBuku=?', whereArgs: [idBuku]);
    return count;
  }
  //fungsi untuk menghapus data tabel book

  Future<int> deleteAnggota(int idAnggota) async {
    Database db = await this.initDb();
    int count = await db
        .delete('anggota', where: 'idAnggota=?', whereArgs: [idAnggota]);
    return count;
  }

  //fungsi untuk mengembalikan nilai data data yang baru dimasukkan
  Future<List<Book>> getBookList() async {
    var bookMapList = await selectBook();
    int count = bookMapList.length;
    List<Book> bookList = List<Book>();
    for (int i = 0; i < count; i++) {
      bookList.add(Book.fromMap(bookMapList[i]));
    }
    return bookList;
  }

  Future<List<Anggota>> getAnggotaList() async {
    var anggotaMapList = await selectAnggota();
    int count = anggotaMapList.length;
    List<Anggota> anggotaList = List<Anggota>();
    for (int i = 0; i < count; i++) {
      anggotaList.add(Anggota.fromMap(anggotaMapList[i]));
    }
    return anggotaList;
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
