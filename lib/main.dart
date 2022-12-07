import 'package:flutter/material.dart';
import 'package:map/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:map/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: Routes.routes,
      initialRoute: Routes.initialRoute,
    );
  }
}