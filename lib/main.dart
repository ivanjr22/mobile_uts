import 'package:flutter/material.dart';
import 'package:mobile_uts/pages/homeBuku.dart'; 
import 'package:mobile_uts/pages/homeStok.dart'; 

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Toko Buku Sarjana',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text("Toko Buku Sarjana"),
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    text: "Daftar Buku",
                  ),
                  Tab(
                    text: "Daftar Stok Buku",
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                HomeBuku(HomeBuku),
                HomeStok(HomeStok),
            ],
          )
        ),
      ),
    );
  }
}