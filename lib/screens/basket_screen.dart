import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/menu_model.dart';
import '../providers/menu_provider.dart';



class BasketScreen extends StatelessWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Position>? positions = context.read<BasketProvider>().positions;
    if (positions == Null) {
      return Text("Корзина пуста");
    }

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: positions!.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 5, top: 5, right: 15, bottom: 5),
              child: Image.network(
                positions[index].image_url,
                height: 60,
                width: 40,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${positions[index].name}",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "${positions[index].cost} ₽",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "${positions[index].sizes}",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  "${positions[index].count} шт.",
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
// Вопрос Сделал как в дизайне размер шрифта, но получил что-то странное
