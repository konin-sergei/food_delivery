import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'basket_screen.dart';
import 'menu_screen.dart';
import 'category_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const String _title = 'Food delivery';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        fontFamily: 'Inter',
        appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.transparent,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              fontSize: 20,
            )),
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w700),
          headline6: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Inter'),
        ),
      ),
      home: MyScreenStatefulWidget(),
    );
  }
}

class MyScreenStatefulWidget extends StatefulWidget {
  const MyScreenStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyScreenStatefulWidget> createState() => _MyScreenStatefulWidgetState();
}

class _MyScreenStatefulWidgetState extends State<MyScreenStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    MenuScreen(),
    BasketScreen(),
    CategoryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Столовка',
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      // Вопрос - а при bottomNavigationBar оказывается состояние поля ввода сбрасывается
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: SvgPicture.asset(
                "assets/image/menu.svg",
                color: Colors.black12,
              ),
            ),
            label: 'Меню',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: SvgPicture.asset(
                "assets/image/basket.svg",
                color: Colors.black12,
              ),
            ),
            label: 'Корзина',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
