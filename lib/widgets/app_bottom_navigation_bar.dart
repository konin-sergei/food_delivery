import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int currentPage;

  AppBottomNavigationBar({
    Key? key,
    required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        // BottomNavigationBarItem(
        //   icon: ImageIcon(
        //     AssetImage("assets/image/menu.jpg"),
        //     color: Color(0xFF3A5A98),
        //   ),
        //   label: 'Меню',
        // ),
        BottomNavigationBarItem(
          icon: Icon(Icons.photo_library_outlined),
          label: 'Корзина',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.photo_library_outlined),
          label: 'Корзина',
        ),
      ],
      currentIndex: currentPage,
      fixedColor: Colors.blue,
      onTap: (int intIndex) {
        if (intIndex != currentPage) {
          switch (intIndex) {
            case 0:
              Navigator.of(context).pushNamed('/menu');
              break;
            case 1:
              Navigator.of(context).pushNamed('/basket');
              break;
          }
        }
      },
    );
  }
}
