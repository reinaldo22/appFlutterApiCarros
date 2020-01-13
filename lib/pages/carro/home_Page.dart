
import 'package:carros/pages/carro/carros_listview.dart';
import 'package:carros/widget/drawer_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: CarrosListView(),
      drawer: DrawerList(),
    );
  }

  
}
