import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/menu_provider.dart';

class CategoryItem extends StatelessWidget {
  final String imageUrl;
  final String categoryName;
  final int cost;

  const CategoryItem(
      {Key? key,
      required this.categoryName,
      required this.imageUrl,
      required this.cost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
    );

    return Container(
      height: 1000, // Вопрос меняю высоту но ничего не происходит (buttom overflow)
      margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(
              imageUrl,
              height: 100,
              width: 100,
            ),
          ),

          Text(
            "${categoryName}",
            textDirection: TextDirection.ltr,
          ),
          // Вопрос Каким лучше способом разносить элементы вправо и влево
          // Ответ GridView
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${cost} ₽",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              MaterialButton(
                height: 40.0,
                minWidth: 40.0,
                color: Colors.green,
                textColor: Colors.white,
                child: new Text("+"),
                onPressed: () => {},
                splashColor: Colors.redAccent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ],
          ),

        ],

      ),
    );
  }
}
