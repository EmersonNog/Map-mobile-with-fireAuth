import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('App de contatos'),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: Image.asset(''),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  _actionButton('Contatos', (){}),
                  _actionButton('Mapa', (){}),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  _actionButton('Configuração', (){}),
                  _actionButton('About', (){})
                ],
              ),
            )
            
          ],
        ),
      );
  }

  Expanded _actionButton(String title, Function action) {
    return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      clipBehavior: Clip.hardEdge, // tira as bordar do ElevatedButton
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      height: double.infinity,
                      child: ElevatedButton(
                        onPressed: action(),
                        child: Text(title),
                        
                      ),
                    ),
                  ),
                );
  }
}