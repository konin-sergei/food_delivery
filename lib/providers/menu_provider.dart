import 'package:flutter/material.dart';

import '../models/menu_model.dart';
import '../repositories/menu_repository.dart';

class MenuProvider with ChangeNotifier {
  Data? _data;

  Data? get data => _data;

  void loadFromJson() async {
    _data = await MenuRepository().fetchMenu();
    notifyListeners();
  }
}


class CategoryProvider with ChangeNotifier {
  Categories? _categories;

  Categories? get categories => _categories;

  void loadFromJson(int category_id) async {
    _categories = await CategoryRepository().fetchCategory(category_id:category_id);
    notifyListeners();
  }
}

class BasketProvider with ChangeNotifier {
  late Basket _basket;

  Basket get basket => _basket;
  List<Position>? get positions => _basket.positions;

  void createBasket(){
    _basket = Basket();
  }
  void addPosition(Position position){
    _basket.positions!.add(position);
  }
}