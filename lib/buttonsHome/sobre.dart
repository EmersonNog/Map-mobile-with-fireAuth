import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:map/pages/home.dart';

class Sobre extends StatefulWidget {
  const Sobre({Key? key}) : super(key: key);

  @override
  State<Sobre> createState() => _AboutState();
}

class _AboutState extends State<Sobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre"),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(onPressed: (){
              Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (context) => Home())
                );
            }, icon: Icon(Icons.arrow_back));
          }
          ),
          actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_box),
            tooltip: 'Sobre o app',
            onPressed: () {},
          )
          ]
      ),
      body: Center(
        child: Container(
          height: 180,
          width: 500,
          decoration: BoxDecoration(
            border: Border.all(
             color: Colors.black,
             width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                spreadRadius: 1,
                blurRadius: 15
              )
            ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text("Aplicativo para conclusão de disciplina",),
              ),
              Container(
                child: Text('Disciplina: Desevolvimento Mobile'),
              ),
              Container(
                child: Text('Prof. Otilio Paulo da Silva Neto'),
              ),
              Container(
                child: Text("Aluno: Emerson N. Santos"),
              )
            ],
          ),
        ),
      )
    );
  }
}