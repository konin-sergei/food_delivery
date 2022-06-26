import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/menu_model.dart';
import '../providers/menu_provider.dart';
import '../widgets/app_bottom_navigation_bar.dart';
import '../widgets/category_item.dart';

class SectionScreen extends StatelessWidget {
  const SectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Вопрос Как лучше передать параметры на другой экран
    // Ответ переименовать section in category
    final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    var section_id = arguments['section_id'];
    print('section_id ${section_id}');

    // return Scaffold(
    //   appBar: AppBar(
    //     leading: IconButton(
    //       icon: Icon(
    //         Icons.backspace,
    //         color: Colors.green,
    //       ),
    //       onPressed: () {},
    //     ),
    //     title: Text("Салаты"),
    //     automaticallyImplyLeading: true,
    //   ),
    //   body: Section(),
    //   bottomNavigationBar: AppBottomNavigationBar(currentPage: 0),
    // );

    return Column(
      children: [
        Text("Салаты"),
        Section(),
      ],
    );
  }
}

class Section extends StatelessWidget {
  const Section({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Вопрос тут странно вызывать метод без передачи category_id
    Categories? categories = context.watch<CategoryProvider>().categories;
    print(categories);

    if (categories != null && categories.products!.length > 0) {
      //   List<Widget> listLeft = [];
      //   List<Widget> listRight = [];
      //
      //   //Filter wrong data
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
        Widget item = CategoryItem(categoryName: product.name!, imageUrl: product.imageUrl!, cost: product.cost!);
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

    return Text('Load...');
  }
}
