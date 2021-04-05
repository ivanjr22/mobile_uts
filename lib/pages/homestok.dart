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
  List<Stok> StokList;
  @override
  Widget build(BuildContext context) {
    updateListView();

    if (StokList == null) {
      StokList = List<Stok>();
    }
    return Scaffold(
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
                var Stok = await navigateToEntryForm(context, null);
                if (Stok != null) {
                  int result = await dbHelper.insertStok(Stok);
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
      BuildContext context, Stok Stok) async {
      var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return FromStok(Stok);
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
              backgroundColor: Colors.blue,
              child: Icon(Icons.book),
            ),
            title: Text(
              this.StokList[index].namaStok,
              style: textStyle,
            ),
            subtitle: Text(
              "Kategori: " + this.StokList[index].kategoriStok +
              "     Stok: " + this.StokList[index].stokStok.toString()),
            trailing: GestureDetector(
              child: Icon(Icons.delete_forever),
              onTap: () async {
                dbHelper.deleteStok(this.StokList[index].idStok);
                updateListView();
              },
            ),
            onTap: () async {
              var Stok =
                  await navigateToEntryForm(context, this.StokList[index]);
              if (Stok != null) {
                int result = await dbHelper.updateStok(Stok);
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
      Future<List<Stok>> StokListFuture = dbHelper.getStokList();
      StokListFuture.then((StokList) {
        setState(() {
          this.StokList = StokList;
          this.count = StokList.length;
        });
      });
    });
  }
}