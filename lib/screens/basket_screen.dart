import 'package:flutter/material.dart';

import '../models/menu_model.dart';
import '../widgets/app_bottom_navigation_bar.dart';


class BasketScreen extends StatelessWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Корзина"),),
      body: Menu(),
      bottomNavigationBar: AppBottomNavigationBar(currentPage: 1),

    );
  }
}



class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  // final MenuData data= [];
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("aas"),);
  }
}