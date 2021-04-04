import 'package:mobile_uts/database/dbhelper.dart';
import 'package:mobile_uts/model/stok.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'entryfromStok.dart';
import 'dart:async';

class HomeStok extends StatefulWidget {
  HomeStok(HomeStok);

  @override
  HomeStokState createState() => HomeStokState();
}

class HomeStokState extends State<HomeStok> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Stok> stokList;
  @override
  Widget build(BuildContext context) {
    updateListView();

    if (stokList == null) {
      stokList = List<Stok>();
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
            child: RaisedButton(
              child: Text("Tambah"),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () async {
                var stok = await navigateToEntryForm(context, null);
                if (stok != null) {
                  int result = await dbHelper.insertStok(stok);
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

  Future<Stok> navigateToEntryForm(
      BuildContext context, Stok stok) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return FromStok(stok);
    }));
    return result;
  }

  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.headline5;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.book),
            ),
            title: Text(
              this.stokList[index].namaBuku,
              style: textStyle,
            ),
            subtitle: Text(
              "Kategori: " + this.stokList[index].kategoriBuku +
              "Penerbit: " + this.stokList[index].penerbitBuku +
              "Stok: " + this.stokList[index].stokBuku.toString()),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () async {
                dbHelper.deleteStok(this.stokList[index].idBuku);
                updateListView();
              },
            ),
            onTap: () async {
              var stok =
                  await navigateToEntryForm(context, this.stokList[index]);
              if (stok != null) {
                int result = await dbHelper.updateStok(stok);
                if (result > 0) {
                  updateListView();
                }
              }
            },
          ),
        );
      },
    );
  }

  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Stok>> stokListFuture = dbHelper.getStokList();
      stokListFuture.then((stokList) {
        setState(() {
          this.stokList = stokList;
          this.count = stokList.length;
        });
      });
    });
  }
}


