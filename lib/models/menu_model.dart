// Сервис json to dart
// https://javiercbk.github.io/json_to_dart/

class Data {
  List<Categories>? categories;

  Data({this.categories});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['menu'] != null) {
      categories = <Categories>[];
      json['menu'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['menu'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// Вопрос не понятно как лучше то ли в множественном то ли в единственном числе
// Ответ - класс в единственном числе
class Categories {
  int? id;
  String? imageUrl;
  String? categoryName;
  List<Products>? products;

  Categories({this.id, this.imageUrl, this.categoryName, this.products});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    categoryName = json['category_name'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_url'] = this.imageUrl;
    data['category_name'] = this.categoryName;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? imageUrl;
  int? cost;
  String? sizes;
  int? categoryId;

  Products({this.id, this.name, this.imageUrl, this.cost, this.sizes, this.categoryId});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
    cost = json['cost'];
    sizes = json['sizes'];
    categoryId = json['categoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image_url'] = this.imageUrl;
    data['cost'] = this.cost;
    data['sizes'] = this.sizes;
    data['categoryId'] = this.categoryId;
    return data;
  }
}

class Position {
  String name;
  String sizes;
  int cost;
  int count;
  String image_url;

  Position(this.name, this.cost, this.count, this.sizes,   this.image_url);
}

class Basket {
  int summ = 0;

  Basket() {
    this.positions = [];
  }

  List<Position>? positions;
}
