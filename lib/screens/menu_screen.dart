import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/menu_model.dart';
import '../widgets/app_bottom_navigation_bar.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    loadData2();
    return Scaffold(
      appBar: AppBar(
        title: Text("Столовка"),
      ),
      body: Menu(),
      bottomNavigationBar: AppBottomNavigationBar(currentPage: 0),
    );
  }
}

Future<void> loadData2() async {
  String data = await rootBundle.loadString('packages/food_delivery/assets/data/data.json');
  final jsonResult = jsonDecode(data); //latest Dart
  print(jsonResult);
}

Future<void> parseJson(context) async {
  String data =
      await DefaultAssetBundle.of(context).loadString("assets/data/data.json");
  final jsonResult = jsonDecode(data); //latest Dart

  String jsonString = '';
  final data2 = dataFromJson(jsonString);
}

class Menu extends StatelessWidget {
//     return Container(
  const Menu({Key? key}) : super(key: key);

// final MenuData data= [];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("cs"),
          // Positioned.fill(
          //   child: Image.asset(
          //     'assets/image/menu.jpg',
          //     fit: BoxFit.cover,
          //   ),
          // ),
        ],
      ),
    );
  }
}

//buildRestaurantList(BuildContext context) {
//       height: MediaQuery.of(context).size.height / 2.4,
//       width: MediaQuery.of(context).size.width,
//       child: ListView.builder(
//         primary: false,
//         shrinkWrap: true,
//         scrollDirection: Axis.horizontal,
//         itemCount: restaurants == null ? 0 : restaurants.length,
//         itemBuilder: (BuildContext context, int index) {
//           Map restaurant = restaurants[index];
//
//           return Padding(
//             padding: const EdgeInsets.only(right: 10.0),
//             child: SlideItem(
//               img: restaurant["img"],
//               title: restaurant["title"],
//               address: restaurant["address"],
//               rating: restaurant["rating"],
//             ),
//           );
//         },
//       ),
//     );
//   }
