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
  TextEditingController namaBukuController = TextEditingController();
  TextEditingController kategoriBukuController = TextEditingController();
  TextEditingController penerbitBukuController = TextEditingController();
  TextEditingController tahunBukuController = TextEditingController();
  TextEditingController stokBukuController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (stok != null) {
      namaBukuController.text = stok.namaBuku;
      kategoriBukuController.text = stok.kategoriBuku;
      penerbitBukuController.text = stok.penerbitBuku;
      tahunBukuController.text = stok.tahunBuku.toString();
      stokBukuController .text = stok.stokBuku.toString();
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
                  controller: namaBukuController,
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
                  controller: kategoriBukuController,
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
                  controller: penerbitBukuController,
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
                  controller: tahunBukuController,
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
                  controller: stokBukuController,
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
                                namaBukuController.text,
                                kategoriBukuController.text,
                                penerbitBukuController.text,
                                int.parse(tahunBukuController.text),
                                int.parse(stokBukuController.text));
                          } else {
                            stok.namaBuku = namaBukuController.text;
                            stok.kategoriBuku = kategoriBukuController.text;
                            stok.penerbitBuku = penerbitBukuController.text;
                            stok.tahunBuku = int.parse(tahunBukuController.text);
                            stok.stokBuku = int.parse(stokBukuController.text);
                          }
                          Navigator.pop(context, Stok);
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