class MenuModel {
  List<MenuModelItem> items = [];

  MenuModel(List<MenuModelItem> this.items);
}

class MenuModelItem {
  String title;
  String image;

  MenuModelItem(this.title, this.image);
}

