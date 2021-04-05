import 'package:flutter/material.dart';
import 'package:mobile_uts/model/buku.dart';
import 'package:mobile_uts/database/dbhelper.dart';

class FromBuku extends StatefulWidget {
  final Buku buku;
  FromBuku(this.buku);
  @override
  FromBukuState createState() => FromBukuState(this.buku);
}

class FromBukuState extends State<FromBuku> {
  Buku buku;
  FromBukuState(this.buku);
  TextEditingController namaBukuController = TextEditingController();
  TextEditingController penerbitBukuController = TextEditingController();
  TextEditingController tahunBukuController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (buku != null) {
      namaBukuController.text = buku.namaBuku;
      penerbitBukuController.text = buku.penerbitBuku;
      tahunBukuController.text = buku.tahunBuku.toString();
    }
    return Scaffold(
        appBar: AppBar(
          title: buku == null ? Text('Tambah') : Text('Edit'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              //Kolom untuk menginput Nama Buku
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
              //Kolom untuk menginput Penerbit Buku
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
              //Kolom untuk menginput Tahun Buku
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
              //button untuk menyimpan data pada tabel buku
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
                          if (buku == null) {
                            buku = Buku(
                                namaBukuController.text,
                                penerbitBukuController.text,
                                int.parse(tahunBukuController.text));
                          } else {
                            buku.namaBuku = namaBukuController.text;
                            buku.penerbitBuku = penerbitBukuController.text;
                            buku.tahunBuku = int.parse(tahunBukuController.text);
                          }
                          Navigator.pop(context, buku);
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