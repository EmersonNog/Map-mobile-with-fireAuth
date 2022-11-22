import 'package:flutter/cupertino.dart';
import 'package:map/pages/home.dart';
import 'package:map/pages/login.dart';
import 'package:map/pages/map.dart';

class Routes {
  static Map<String, Widget Function(BuildContext context)> routes = <String, WidgetBuilder>{
    '/login': (context) => const LoginPage(),
    '/home': (context) => const Home(),
    '/mapa': (context) => const Mapa(),
  };

  static String initialRoute = '/home';
}