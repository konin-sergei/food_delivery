import 'package:flutter/material.dart';

import 'screens/basket_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/section_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              elevation: 0,
              backgroundColor: Colors.transparent,
              titleTextStyle: TextStyle(
                color: Colors.black,
              ))),
      debugShowCheckedModeBanner: false,
      initialRoute: '/menu',
      routes: {
        '/menu': (context) => MenuScreen(),
        '/section': (context) => SectionScreen(),
        '/basket': (context) => BasketScreen(),
      },
    );
  }
}
