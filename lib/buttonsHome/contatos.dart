import 'package:flutter/material.dart';
import 'package:map/pages/home.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', // Não visível
      debugShowCheckedModeBanner: false, // retira o debug da tela
      theme: ThemeData(
        primarySwatch: Colors.blue, // Swatch permiti várias tonalidades da cor
      ),
      home: HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
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
            icon: const Icon(Icons.contact_phone),
            tooltip: 'contatos',
            onPressed: () {},
          )
          ]
      ),
      body: Center(
        child: Container(
          child: ListView(
            children: <Widget>[
              contato("Thiago", "(89) 99983-0623"),
              contato("Tadeu", "(86) 99913-3222"),
              contato("Eva", "(11) 99441-8643"),
              contato("Pedro", "(15) 99812-9423")
                  ],
              ),
        ),
      )
       
          
        );
      }

  Card contato(String nome, String numero) {
    return Card(
    child: ListTile(
      leading: Icon(
        Icons.phone,
        color: Colors.green,
      ),
      trailing: Wrap(
          runSpacing: 4.0,
          spacing: -16,
          children: [
            IconButton(
              icon: const Icon(
                Icons.edit,
              ),
              onPressed: () {
                
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.redAccent,
              ),
              onPressed: () {},
            ),
          ],
        ),
      title: Text(nome),
      subtitle: Text(numero),
          ),
        );
  }
}
