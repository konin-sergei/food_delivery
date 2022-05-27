// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'dart:convert';

List<Data> dataFromJson(String str) => List<Data>.from(json.decode(str).map((x) => Data.fromJson(x)));

String dataToJson(List<Data> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Data {
  Data({
    required this.id,
    required this.imageUrl,
    required this.categoryName,
    required this.products,
  });

  int id;
  String imageUrl;
  String categoryName;
  List<Product> products;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    imageUrl: json["image_url"],
    categoryName: json["category_name"],
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image_url": imageUrl,
    "category_name": categoryName,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.cost,
    required this.sizes,
    required this.categoryId,
  });

  int id;
  String name;
  String imageUrl;
  int cost;
  String sizes;
  int categoryId;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    imageUrl: json["image_url"],
    cost: json["cost"],
    sizes: json["sizes"],
    categoryId: json["categoryId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image_url": imageUrl,
    "cost": cost,
    "sizes": sizes,
    "categoryId": categoryId,
  };
}
