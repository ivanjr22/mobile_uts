import 'package:flutter/material.dart';
import 'package:mobile_uts/pages/home.dart'; 
import 'package:mobile_uts/pages/homestok.dart'; 

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tambah',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text("Stok Toko Buku"),
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    text: "Daftar Buku",
                  ),
                  Tab(
                    text: "Stok Buku",
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Home(Home),
                HomeStok(HomeStok),
            ],
          )
        ),
      ),
    );
  }
}