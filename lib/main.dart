import 'package:flutter/material.dart';
import 'package:food_delivery/providers/menu_provider.dart';
import 'package:food_delivery/screens/main_screen.dart';
import 'package:provider/provider.dart';

import 'screens/basket_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/tmp_menu_screen.dart';
import 'screens/section_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MenuProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ],
      child: const App(),
    );
  }
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);


  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MenuProvider>(context, listen: false).loadFromJson();
    });

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/menu',

      routes: {
        //'/menu': (context) => MenuScreen(),
        //'/menu': (context) => TmpMenuOffstageScreen(),
        '/menu': (context) => MainScreen(),
        // Вопрос Важный - как использовать  BottomNavigationBarItem и routes т.е. при клике на позицию меню переходить на виджет с каталогом подменю
        '/section': (context) => SectionScreen(),
        // Вопрос добавил в конструктор id и теперь не понятно как это дело учитывать в мэминге роутера
        // пришлось добавить this.id=0 в конструктор
        '/basket': (context) => BasketScreen(),
      },
    );
  }
}

// Вопрос 19.06.2022
// Что значит Баннеры — просто картинки. Верстать не нужно