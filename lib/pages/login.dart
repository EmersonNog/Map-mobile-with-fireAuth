import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:map/check.dart';
import 'package:map/pages/register.dart';
import '../widgets/widgets.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _firebaseAuth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final  _passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Form(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Instituto_Federal_do_Piau%C3%AD_-_Marca_Vertical_2015.svg/1200px-Instituto_Federal_do_Piau%C3%AD_-_Marca_Vertical_2015.svg.png"),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _emailController,
                    decoration: textInputDecoration.copyWith(
                      labelText: "Email",
                      hintText: "exemple@email.com",
                      prefix: const Icon(
                        Icons.email,
                        color: Colors.orange,
                      ),
                    )
                  ),

                  const SizedBox(height: 22),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: textInputDecoration.copyWith(
                        labelText: "Senha",
                        hintText: "Insira sua senha",
                        prefix: Icon(
                          Icons.lock,
                          color: Colors.orange,
                        )),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text(
                        "Entre",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () {
                        loginAuth();
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text(
                        "Cadastrar",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context, MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          )
                        );
                      },
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  loginAuth() async {
      try{
        UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        if(userCredential != null) {
          Navigator.pushReplacement(
            context, MaterialPageRoute(
              builder: (context) => Home(),
            )
          );
        }
      } on FirebaseAuthException catch(e) {
        if(e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content:
              Text('Usuário não encontrado'),
              backgroundColor: Colors.redAccent,
            )
          );
        } else if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content:
            Text('Senha errada'),
            backgroundColor: Colors.redAccent,
            )
          );
        }
      }
    }
}