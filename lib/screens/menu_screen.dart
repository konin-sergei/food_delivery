import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/providers/menu_provider.dart';

import '../models/menu_model.dart';
import '../widgets/app_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

import '../widgets/main_menu_item.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // loadData();
    return Scaffold(
      appBar: AppBar(
        title: Text("Столовка"),
      ),
      body: Container(
        child: Menu(),
      ),
      //body: Menu(),
      bottomNavigationBar: AppBottomNavigationBar(currentPage: 0),
    );
  }
}

class Menu extends StatelessWidget {
  //     return Container(
  const Menu({Key? key}) : super(key: key);

  // Вопрос Как сделать чтоб картинка заходила вправа и обрезалась
  // Вопрос Как сделать текст выровнять влево
  // Вопрос Как в один заход вывести четные и не четные элементы меню в шахматном порядке
  // Вопрос Как перебрать элементы с инднексом элемента
  // вот в таком примере for (var category in data.categories!) {

  // final MenuData data= [];

  @override
  Widget build(BuildContext context) {
    Data? data = context.watch<MenuProvider>().data;

    if (data != null && data.categories!.length > 0) {
      List<Widget> listLeft = [];
      List<Widget> listRight = [];

      for (var i=0; i<data.categories!.length; i++){
        var category = data.categories![i];
        Widget item = MainMenuItem(
            categoryName: category.categoryName!,
            imageUrl: category.imageUrl!,
            section_id: category.id!);
        if (i.isEven==true){
          listLeft.add(item);
        }else{
          listRight.add(item);
        }
      }

      return Row(
        children: [
          Column(
            children: listLeft,
          ),
          Column(
            children: listRight,
          ),
        ],
      );
    }


    return Text('Loading ...');

  }
}
