import 'package:flutter/material.dart';
import 'package:food_delivery/providers/menu_provider.dart';
import 'package:provider/provider.dart';

import '../models/menu_model.dart';
import '../widgets/app_bottom_navigation_bar.dart';
import '../widgets/main_menu_item.dart';

// class MenuScreen extends StatelessWidget {
//   const MenuScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Столовка"),
//       ),
//       body: Container(
//         child: Menu(),
//       ),
//       //body: Menu(),
//       // bottomNavigationBar: AppBottomNavigationBar(currentPage: 0),
//         bottomNavigationBar: AppBottomNavigationBar(currentPage: 0),
//     );
//   }
// }

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Data? data = context.watch<MenuProvider>().data;

    if (data != null && data.categories!.length > 0) {
      List<Widget> listItems = [];

      for (var i = 0; i < data.categories!.length; i++) {
        var category = data.categories![i];
        Widget item = MainMenuItem(categoryName: category.categoryName!, imageUrl: category.imageUrl!, section_id: category.id!);
        listItems.add(item);
      }

      return GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        crossAxisCount: 2,
        children: listItems,
      );
    }

    return Text('Loading ...');
  }
}
