import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/menu_model.dart';
import '../providers/menu_provider.dart';
import '../widgets/app_bottom_navigation_bar.dart';

class SectionScreen extends StatelessWidget {
  final int section_id;

  const SectionScreen({Key? key, this.section_id = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Вопрос Как лучше передать параметры на другой экран
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    var section_id = arguments['section_id'];
    print('section_id ${section_id}');

    // Вопрос - непонятно толи сохранить data menu то ли заново по api выкачать
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   Provider.of<CategoryProvider>(context, listen: false).loadFromJson(section_id);
    // });

    // Вопрос не работает
    Provider.of<CategoryProvider>(context, listen: false).loadFromJson(section_id);

    Categories? categories = context.watch<CategoryProvider>().categories;
    print(categories);

    return Scaffold(
      appBar: AppBar(
        title: Text("Салаты"),
        automaticallyImplyLeading: true,
      ),
      body: Section(),
      bottomNavigationBar: AppBottomNavigationBar(currentPage: 0),
    );
  }
}

class Section extends StatelessWidget {
  const Section({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    Data? data = context.watch<MenuProvider>().data;

    return Container(
      child: Text("aas"),
    );
  }
}
