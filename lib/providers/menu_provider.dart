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
