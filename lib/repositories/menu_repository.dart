import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/menu_model.dart';

class MenuRepository {
  Future<Data?> fetchMenu() async {
    var dio = Dio();
    final response = await dio.get('https://gist.githubusercontent.com/pabushabi/d0ae94f936156055b0d22a40c9979e0b/raw/1e11b17b3dac9ffb056afa4240db94f5cc3bac4a/menu.json');
    var jsonMapData = jsonDecode(response.data);
    var data = Data.fromJson(jsonMapData);
    return data;
  }
}
