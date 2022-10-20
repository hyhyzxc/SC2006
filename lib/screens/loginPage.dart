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
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: nameController,
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
                      child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    SizedBox(height: 120,),
                    TextButton(
                      onPressed: () {

                        //forgot password screen
                      },
                      child: const Text('Forgot Password',),
                    ),
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
                          onTap: () {
                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                email: nameController.text,
                                password: passwordController.text)
                                .then((value) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => HomeScreen()));
                            }).onError((error, stackTrace) {
                              print("Error ${error.toString()}");
                            });
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



// import 'package:flutter/material.dart';
// import 'package:next_stage/screens/registrationPage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// import 'homePage.dart';
//
// class loginPage extends StatefulWidget {
//   const loginPage({Key? key}) : super(key: key);
//
//   @override
//   State<loginPage> createState() => _loginPageState();
// }
//
// class _loginPageState extends State<loginPage> {
//
//
//   TextEditingController nameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text('LOGIN PAGE DUDE'),
//           automaticallyImplyLeading: false,
//         ),
//       //  padding: const EdgeInsets.all(10),
//       body: Center(
//         child: ListView(
//           children: <Widget>[
//             Container(
//                 alignment: Alignment.center,
//                 padding: const EdgeInsets.all(10),
//                 child: const Text(
//                   'ONE-STOP AFTERLIFE PROCEDURE',
//                   style: TextStyle(
//                       color: Colors.black54,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 23),
//                 )),
//             Container(
//                 alignment: Alignment.center,
//                 padding: const EdgeInsets.all(10),
//                 child: const Text(
//                   'Sign in',
//                   style: TextStyle(fontSize: 20),
//                 )),
//             Container(
//               padding: const EdgeInsets.all(10),
//               child: TextField(
//                 controller: nameController,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Email',
//                 ),
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//               child: TextField(
//                 obscureText: true,
//                 controller: passwordController,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Password',
//                 ),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//
//                 //forgot password screen
//               },
//               child: const Text('Forgot Password',),
//             ),
//             Container(
//                 height: 50,
//                 padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                 child: ElevatedButton(
//                   child: const Text('Login'),
//                   onPressed: () {
//                     FirebaseAuth.instance
//                         .signInWithEmailAndPassword(
//                         email: nameController.text,
//                         password: passwordController.text)
//                         .then((value) {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => HomeScreen()));
//                     }).onError((error, stackTrace) {
//                       print("Error ${error.toString()}");
//                     });
//                     //print(nameController.text);
//                     //print(passwordController.text);
//                     //Navigator.push(context,
//                     // MaterialPageRoute(builder: (context) => HomeScreen()));
//                   },
//                 )
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 const Text('Does not have account?'),
//                 TextButton(
//                   child: const Text(
//                     'Sign up',
//                     style: TextStyle(fontSize: 15),
//                   ),
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => registerPage()));
//
//                     //signup screen
//                   },
//                 )
//               ],
//             ),
//           ],
//         )));
//   }
// }
