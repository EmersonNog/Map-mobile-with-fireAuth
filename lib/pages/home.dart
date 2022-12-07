import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:map/buttonsHome/contatos.dart';
import 'package:map/buttonsHome/sobre.dart';
import 'package:map/check.dart';
import 'package:map/buttonsHome/map.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Inicio'),
          actions: [
          IconButton(
            icon: Icon(Icons.logout),
            tooltip: "Sair",
            onPressed: (){
              sair();
            },
          )
        ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Center(
                child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Instituto_Federal_do_Piau%C3%AD_-_Marca_Vertical_2015.svg/1200px-Instituto_Federal_do_Piau%C3%AD_-_Marca_Vertical_2015.svg.png"),
              ),
            ),
            const SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 80,
                  width: 100,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87,
                        spreadRadius: 1,
                        blurRadius: 8,
                        blurStyle: BlurStyle.outer,
                      )
                    ],
                  ),
                  child: ElevatedButton(
                    child: Text("Contatos"),
                    onPressed: (){
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(
                            builder: (context) => App(),
                          )
                        );
                    },
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  height: 80,
                  width: 100,
                   decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87,
                        spreadRadius: 1,
                        blurRadius: 8,
                        blurStyle: BlurStyle.outer,
                      )
                    ],
                  ),
                  child: ElevatedButton(
                    child: Text("Mapa"),
                    onPressed: (){
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(
                            builder: (context) => Mapa(),
                          )
                        );
                    },
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                   decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87,
                        spreadRadius: 1,
                        blurRadius: 8,
                        blurStyle: BlurStyle.outer,
                      )
                    ],
                  ),
                  height: 80,
                  width: 100,
                  child: ElevatedButton(
                    child: Text("Sobre"),
                    onPressed: (){
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(
                            builder: (context) => Sobre(),
                          )
                        );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            
          ],
        ),
      );
  }
              
    sair() async{
    await _firebaseAuth.signOut().then((usuario) => 
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(
        builder: (context) => ChecagemPage(),
        )
      )
    );
  }
  }
