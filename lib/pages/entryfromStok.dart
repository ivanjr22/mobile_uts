import 'package:flutter/material.dart';
import 'package:mobile_uts/model/stok.dart';
import 'package:mobile_uts/database/dbhelper.dart';

class FromStok extends StatefulWidget {
  final Stok stok;
  FromStok(this.stok);
  @override
  FromStokState createState() => FromStokState(this.stok);
}

class FromStokState extends State<FromStok> {
  Stok stok;
  FromStokState(this.stok);
  TextEditingController namaStokController = TextEditingController();
  TextEditingController kategoriStokController = TextEditingController();
  TextEditingController penerbitStokController = TextEditingController();
  TextEditingController tahunStokController = TextEditingController();
  TextEditingController stokStokController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (stok != null) {
      namaStokController.text = stok.namaStok;
      kategoriStokController.text = stok.kategoriStok;
      penerbitStokController.text = stok.penerbitStok;
      tahunStokController.text = stok.tahunStok.toString();
      stokStokController .text = stok.stokStok.toString();
    }
    return Scaffold(
        appBar: AppBar(
          title: stok == null ? Text('Tambah') : Text('Edit'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: namaStokController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nama Buku',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: kategoriStokController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Kategori Buku',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: penerbitStokController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Penerbit Buku',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: tahunStokController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Tahun Buku',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: stokStokController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Stok Buku',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text('Simpan',textScaleFactor: 1.5,),
                        onPressed: () {
                          if (stok == null) {
                            stok = Stok(
                                namaStokController.text,
                                kategoriStokController.text,
                                penerbitStokController.text,
                                int.parse(tahunStokController.text),
                                int.parse(stokStokController.text));
                          } else {
                            stok.namaStok = namaStokController.text;
                            stok.kategoriStok = kategoriStokController.text;
                            stok.penerbitStok = penerbitStokController.text;
                            stok.tahunStok = int.parse(tahunStokController.text);
                            stok.stokStok = int.parse(stokStokController.text);
                          }
                          Navigator.pop(context, stok);
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text('Batal',textScaleFactor: 1.5,),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      );
  }
}