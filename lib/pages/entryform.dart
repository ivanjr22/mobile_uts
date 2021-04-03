import 'package:flutter/material.dart';
import 'package:mobile_uts/model/item.dart';

class EntryForm extends StatefulWidget {
  final Item item;
  EntryForm(this.item);
  @override
  EntryFormState createState() => EntryFormState(this.item);
}

//class controller
class EntryFormState extends State<EntryForm> {
  Item item;
  EntryFormState(this.item);
  TextEditingController judulbukuController = TextEditingController();
  TextEditingController penerbitController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  TextEditingController tahunterbitController = TextEditingController();
  TextEditingController expiredController = TextEditingController();
  @override
  Widget build(BuildContext context) {
//kondisi
    if (item != null) {
      judulbukuController.text = item.judulbuku;
      penerbitController.text = item.penerbit;
      hargaController.text = item.harga.toString();
      stockController.text = item.stock.toString();
      tahunterbitController.text = item.tahunterbit;
    }
//rubah
    return Scaffold(
        appBar: AppBar(
          title: item == null ? Text('Tambah') : Text('Ubah'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
// nama
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: judulbukuController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Judul Buku',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
//
                  },
                ),
              ),
// merk
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: penerbitController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Penerbit Buku',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
//
                  },
                ),
              ),
//harga
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: hargaController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Harga Barang',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
//
                  },
                ),
              ),
//stock
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: stockController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Stock Barang',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
//
                  },
                ),
              ),
//kodebarang
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: tahunterbitController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Tahunt Terbit',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
//
                  },
                ),
              ),
//expired
             
// tombol button
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
// tombol simpan
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          if (item == null) {
// tambah data
                            item = Item(
                                judulbukuController.text,
                                penerbitController.text,
                                int.parse(hargaController.text),
                                int.parse(stockController.text),
                                int.parse(tahunterbitController.text),
                                );
                          } else {
// ubah data
                            item.judulbuku = judulbukuController.text;
                            item.penerbit = penerbitController.text;
                            item.harga = int.parse(hargaController.text);
                            item.stock = int.parse(stockController.text);
                            item.tahunterbit = tahunterbitController.text;
                          }
// kembali ke layar sebelumnya dengan membawa objek item
                          Navigator.pop(context, item);
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
// tombol batal
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Cancel',
                          textScaleFactor: 1.5,
                        ),
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
        ));
  }
}
