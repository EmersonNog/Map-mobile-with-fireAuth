import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:map/check.dart';
import 'package:map/pages/login.dart';
import 'package:map/widgets/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  @override
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  cadastrar() async {
    try {
      UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text
        );
          
      if(userCredential != null) {
        userCredential.user!.updateDisplayName(_nameController.text);
        Navigator.pushAndRemoveUntil(
        context, 
        MaterialPageRoute(
          builder: (context) => ChecagemPage(),
        ),
        (route) => false);
      }
    }on FirebaseAuthException catch (e) {
      if(e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content:
              Text('Crie uma senha mais segura'),
              backgroundColor: Colors.redAccent,
            )
          );
      }else if(e.code == 'email-already-in-use'){
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content:
              Text('Email já cadastrado'),
              backgroundColor: Colors.redAccent,
            )
          );
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Instituto_Federal_do_Piau%C3%AD_-_Marca_Vertical_2015.svg/1200px-Instituto_Federal_do_Piau%C3%AD_-_Marca_Vertical_2015.svg.png"),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _nameController,
                          decoration: textInputDecoration.copyWith(
                              labelText: "Nome",
                              hintText: 'Insira seu nome',
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.orange,
                              )),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _emailController,
                          decoration: textInputDecoration.copyWith(
                              labelText: "Email",
                              hintText: "example@email.com",
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.orange,
                              )),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: textInputDecoration.copyWith(
                              labelText: "Senha",
                              hintText: "Insira sua senha",
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.orange,
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            child: const Text(
                              "Cadastre-se",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            onPressed: () {
                              cadastrar();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text.rich(TextSpan(
                          text: "Já possui uma conta? ",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: "Login",
                                style: const TextStyle(
                                    color: Colors.black,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    nextScreen(context, const LoginPage());
                                  }),
                          ],
                        )),
                      ],
                    )),
              ),
            ),
          );
        }
      }