import 'package:flutter/cupertino.dart';
import 'package:map/buttonsHome/map.dart';
import 'package:map/check.dart';
import 'package:map/pages/home.dart';
import 'package:map/pages/login.dart';
import 'package:map/pages/register.dart';

class Routes {
  static Map<String, Widget Function(BuildContext context)> routes = <String, WidgetBuilder>{
    '/cadaster': (context) => const RegisterPage(),
    '/login': (context) => const LoginPage(),
    '/home': (context) => const Home(),
    '/mapa': (context) => const Mapa(),
    '/check': (context) => const ChecagemPage(),
  };

  static String initialRoute = '/check';
}