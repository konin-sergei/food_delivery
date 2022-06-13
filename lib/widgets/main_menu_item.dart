import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/menu_provider.dart';

// Вопрос - не смог переименовать виджет и файл в MainItem
class MainMenuItem extends StatelessWidget {
  final String imageUrl;
  final String categoryName;
  final int section_id;

  const MainMenuItem(
      {Key? key, required this.categoryName, required this.imageUrl, required this.section_id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // User user = User(name: 'Sergey', age: 20);
        // Navigator.pushNamed(context, '/section',
        //     arguments: WriteDeveloperArgument(user));

        Provider.of<CategoryProvider>(context, listen: false).loadFromJson(section_id);

        // Вопрос как добавить после перехода но новую страницу кнопку обратно
        Navigator.of(context)
            .pushNamed('/section', arguments: {'section_id': section_id});

        print("sssss 22222");
      },
      child: Container(
        margin: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
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
              height: 100,
              width: 100,
            ),
            Text(
              "${categoryName}",
              textDirection: TextDirection.ltr,
            ),
          ],
        ),
      ),
    );
  }
}
