import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/menu_model.dart';
import '../providers/menu_provider.dart';
import '../widgets/app_bottom_navigation_bar.dart';
import '../widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Вопрос Как лучше передать параметры на другой экран
    // Ответ переименовать section in category


    // if (ModalRoute.of(context)?.settings.arguments == null) {
    //   return Text("Load...");
    // }
    var arguments;
    arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;

    var category_id = arguments['category_id'];
    print('category_id ${category_id}');

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        title: Text("Салаты"),
        automaticallyImplyLeading: true,
      ),
      body: Category(),
      bottomNavigationBar: AppBottomNavigationBar(currentPage: 0),
    );

  }
}

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Вопрос тут странно вызывать метод без передачи category_id
    Categories? categories = context.watch<CategoryProvider>().categories;
    print(categories);

    if (categories != null && categories.products!.length > 0) {
      List<Products> filterProducts = [];
      for (var i = 0; i < categories.products!.length; i++) {
        var product = categories.products![i];

        if (product.imageUrl != "") {
          filterProducts.add(product);
        }
      }
      List<Widget> listItems = [];
      for (var i = 0; i < filterProducts.length; i++) {
        var product = filterProducts[i];
        Widget item = CategoryItem(categoryName: product.name!, imageUrl: product.imageUrl!, cost: product.cost!, sizes: product.sizes!);
        listItems.add(item);
      }

      return GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        crossAxisCount: 2,
        children: listItems,
        childAspectRatio: 700 / 1000,
      );
    }

    return Text('Load...');
  }
}
