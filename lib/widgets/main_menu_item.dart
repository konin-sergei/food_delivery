import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/menu_provider.dart';
import '../screens/category_screen.dart';

class MainMenuItem extends StatelessWidget {
  final String imageUrl;
  final String categoryName;
  final int category_id;

  const MainMenuItem({Key? key, required this.categoryName, required this.imageUrl, required this.category_id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Улучшить Provider.of<CategoryProvider>(context, listen: false).callButton();
        Provider.of<CategoryProvider>(context, listen: false).loadFromJson(category_id);

        // Вопрос - pushNamed не работает теперь!
        // Could not find a generator for route RouteSettings("/category", {category_id: 3}) in the _WidgetsAppState.
        // Navigator.of(context).pushNamed('/category', arguments: {'category_id': category_id});

        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return CategoryScreen();
            },
          ),
        );

      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
            height: 170,
            width: 170,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 50,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Image.network(
                  imageUrl,
                  height: 140,
                  width: 150,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${categoryName}",
                      textDirection: TextDirection.ltr,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
