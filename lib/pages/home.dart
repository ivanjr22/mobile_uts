import 'package:flutter/material.dart';
import 'package:mobile_uts/database/dbhelper.dart';
import 'package:mobile_uts/model/item.dart';
import 'package:mobile_uts/pages/entryform.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

//pendukung program asinkron
class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  DbHelper dbHelper = DbHelper();

  int count = 0;
  
  List<Buku> itemList;

  @override
  Widget build(BuildContext context) {
    updateListView();
    if (itemList == null) {
      // ignore: deprecated_member_use
      itemList = List<Buku>();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Stok Buku'),
      ),

      body: Column(children: [
        Expanded(
          child: createListView(),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            // ignore: deprecated_member_use
            child: RaisedButton(
              child: Text("Tambah Buku"),
              onPressed: () async {
                var item = await navigateToEntryForm(context, null);
                if (item != null) {
                  //TODO 2 Panggil Fungsi untuk Insert ke DB
                  int result = await dbHelper.insert(item);
                  if (result > 0) {
                    updateListView();
                  }
                }
              },
            ),
          ),
        ),
      ]),
    );
  }

  Future<Buku> navigateToEntryForm(BuildContext context, Buku buku) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return EntryForm(Item);
        }
      )
    );
    return result;
  }

  ListView createListView() {
    // ignore: deprecated_member_use
    TextStyle textStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.people),
            ),
            title: Text(
              this.itemList[index].judulbuku,
              style: textStyle,
            ),
            subtitle: 
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Judul : ' + this.itemList[index].judulbuku
                    ),
                   
                  ],
                ),
              ),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () async {
                //TODO 3 Panggil Fungsi untuk Delete dari DB berdasarkan Item
                int result = await dbHelper.delete(this.itemList[index]);
                updateListView();
              },
            ),
            onTap: () async {
              var item =
              await navigateToEntryForm(context, this.itemList[index]);
              //TODO 4 Panggil Fungsi untuk Edit data
              int result = await dbHelper.update(item);
              updateListView();
            },
          ),
        );
      },
    );
  }

  //update List item
  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      //TODO 1 Select data dari DB
      Future<List<Buku>> itemListFuture = dbHelper.getBarangList();
      itemListFuture.then((itemList) {
        setState(() {
          this.itemList = itemList;
          this.count = itemList.length;
        });
      });
    });
  }
}

class Buku {
  String judulbuku;

  get stok => null;

  get id => null;

  Map<String, dynamic> toMap() {}

  static Buku fromMap(Map<String, dynamic> bukuMapList) {}
}