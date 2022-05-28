import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


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
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/image/menu.svg",
            semanticsLabel: 'Acme Logo',
            color: Colors.black12,
          ),
          label: 'Корзина',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/image/basket.svg",
            semanticsLabel: 'Acme Logo',
            color: Colors.black12,
          ),
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
