import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/providers/menu_provider.dart';

import '../models/menu_model.dart';
import '../widgets/app_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // loadData();
    return Scaffold(
      appBar: AppBar(
        title: Text("Столовка"),
      ),
      body: Menu(),
      bottomNavigationBar: AppBottomNavigationBar(currentPage: 0),
    );
  }
}

class Menu extends StatelessWidget {
//     return Container(
  const Menu({Key? key}) : super(key: key);

// final MenuData data= [];
  @override
  Widget build(BuildContext context) {
    Data? data = context.watch<MenuProvider>().data;
    return Container(
      child: Column(
        children: [
          data == null
              ? Text("No data")
              : Text("Has data ${data!.categories!.length}"),
          Text("cs"),
        ],
      ),
    );
  }
}
