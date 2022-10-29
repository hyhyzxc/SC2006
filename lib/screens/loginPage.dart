import 'package:flutter/material.dart';
import 'package:next_stage/screens/registrationPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'homePage.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {


  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _key=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text('LOGIN'),
      //   automaticallyImplyLeading: false,
      // ),
      //  padding: const EdgeInsets.all(10),
        body: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.cover,
                  colorFilter:
                  ColorFilter.mode(Colors.white.withOpacity(0.6),BlendMode.srcOver)
              ),
            ),
            child: Center(
                child: ListView(
                  children: <Widget>[
                    SizedBox(height: 120,),
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'NextStage',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              fontFamily: 'CatalishHuntera'
                          ),
                        )),
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Sign in',
                          style: TextStyle(fontSize: 20),
                        )),
                    Form(
                      key: _key,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: nameController,
                              validator: validateEmail,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                labelText: 'Email',
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: TextFormField(
                              obscureText: true,
                              controller: passwordController,
                              validator: validatePassword,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                labelText: 'Password',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 120,),
                    Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: 250,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xFF8A2387),
                                      Color(0xFFE94057),
                                      Color(0xFFF27121),
                                    ])
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text('Login',
                                style: TextStyle(color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          onTap: () async {
                            if (_key.currentState!.validate()) {
                              FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                  email: nameController.text,
                                  password: passwordController.text)
                                  .then((value) {
                                Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                              }).onError((error, stackTrace) {
                                print("Error ${error.toString()}");
                              });
                            }
                            //print(nameController.text);
                            //print(passwordController.text);
                            //Navigator.push(context,
                            // MaterialPageRoute(builder: (context) => HomeScreen()));
                          },
                        )
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('Does not have account?'),
                        TextButton(
                          child: const Text(
                            'Sign up',
                            style: TextStyle(fontSize: 15),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => registerPage()));

                            //signup screen
                          },
                        )
                      ],
                    ),
                    SizedBox(height: 50,),
                  ],
                ))));
  }
}

String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return 'E-mail address required';
  }
  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) return 'Invalid E-mail Address format.';
  return null;
}

String? validatePassword(String? formPassword) {
  if (formPassword == null || formPassword.isEmpty) {
    return 'Password required';
  }
  String pattern =
      r'^(?=.*?[a-z]).{8,}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formPassword))
    return '''
      Password must be at least 8 characters,
      ''';
  return null;
}
