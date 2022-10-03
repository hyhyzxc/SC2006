import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'homePage.dart';

class registerPage extends StatefulWidget {
  const registerPage({Key? key}) : super(key: key);

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ContactNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Registration Page'),
          automaticallyImplyLeading: false,
        ),
        //  padding: const EdgeInsets.all(10),
        body: Center(
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Registration Page',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 23),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Please key in your details below',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email Address',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: ContactNumber,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contact Number',
                    ),
                  ),
                ),
                Container(
                    height: 70,
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Register'),
                      onPressed: () {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text)
                            .then((value) {
                          print("Created New Account");
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => HomeScreen()));
                        }).onError((error, stackTrace) {
                          print("Error ${error.toString()}");
                        });
                      },
                    )
                ),
              ],
            )));
  }
}