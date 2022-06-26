import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'basket_screen.dart';
import 'menu_screen.dart';
import 'section_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    MenuScreen(),
    BasketScreen(),
    SectionScreen(),
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
        title: const Text('Основное меню'),
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
