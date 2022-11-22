import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Nogg Map'),
          backgroundColor: Colors.green[400],
        ),
        body: Center(
          child: ElevatedButton(
            child: Text('Mapa'),
            onPressed: () => Navigator.pushNamed(context, "/home"),
          ),
        )
      );
  }
}