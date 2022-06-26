import 'package:flutter/material.dart';

import 'basket_screen.dart';
import 'menu_screen.dart';

class TmpMenuOffstageScreen extends StatefulWidget {
  const TmpMenuOffstageScreen({Key? key}) : super(key: key);

  @override
  State<TmpMenuOffstageScreen> createState() => _TmpMenuOffstageScreenState();
}

class _TmpMenuOffstageScreenState extends State<TmpMenuOffstageScreen> {
  // @override
  // Widget build(BuildContext context) {
  //   return Container();
  // }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Offstage(
            offstage: index != 0,
            child: TickerMode(
              enabled: index == 0,
              child: MaterialApp(home: MenuScreen()),
            ),
          ),
          Offstage(
            offstage: index != 1,
            child: TickerMode(
              enabled: index == 1,
              child: MaterialApp(home: BasketScreen()),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (int index) {
          setState(() {
            this.index = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Left",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Right",
          ),
        ],
      ),
    );
  }
}
