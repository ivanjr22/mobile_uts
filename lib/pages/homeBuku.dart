import 'package:mobile_uts/database/dbhelper.dart';
import 'package:mobile_uts/model/buku.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'entryfromBuku.dart';
import 'dart:async';

class HomeBuku extends StatefulWidget {
  HomeBuku(HomeBuku);

  @override
  HomeBukuState createState() => HomeBukuState();
}

class HomeBukuState extends State<HomeBuku> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Buku> BukuList;
  @override
  Widget build(BuildContext context) {
    updateListView();

    if (BukuList == null) {
      BukuList = List<Buku>();
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
                var Buku = await navigateToEntryForm(context, null);
                if (Buku != null) {
                  int result = await dbHelper.insertBuku(Buku);
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

  Future<Buku> navigateToEntryForm(BuildContext context, Buku Buku) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return FromBuku(Buku);
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
              child: Icon(Icons.bookmark),
            ),
            title: Text(
              this.BukuList[index].namaBuku,
              style: textStyle,
            ),
            subtitle: Text(
              "Penerbit: " + this.BukuList[index].penerbitBuku),
            trailing: GestureDetector(
              child: Icon(Icons.delete_forever),
              onTap: () async {
                dbHelper.deleteBuku(this.BukuList[index].idBuku);
                updateListView();
              },
            ),
            onTap: () async {
              var Buku =
                  await navigateToEntryForm(context, this.BukuList[index]);
              if (Buku != null) {
                int result = await dbHelper.updateBuku(Buku);
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
      Future<List<Buku>> BukuListFuture = dbHelper.getBukuList();
      BukuListFuture.then((BukuList) {
        setState(() {
          this.BukuList = BukuList;
          this.count = BukuList.length;
        });
      });
    });
  }
}