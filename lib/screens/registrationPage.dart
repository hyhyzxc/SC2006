import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'homePage.dart';
import 'package:next_stage/models/plan.dart';
import 'package:next_stage/models/user.dart';

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

  Future saveNewPlan({required Plan plan, required String user_id}) async {
    final docUser = FirebaseFirestore.instance.collection('Plan').doc(user_id);
    final json = plan.getJson();
    await docUser.set(json);
  }

  Future saveNewUser({required Users user, required String user_id}) async {
    final docUser = FirebaseFirestore.instance.collection("User").doc(user_id);
    final json = user.getJson();
    await docUser.set(json);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text('Registration Page'),
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
            child:Center(
                child: ListView(
                  children: <Widget>[
                    SizedBox(height: 80,),
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
                          'Please key in your details below',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'NATS'),
                        )),
                    SizedBox(height: 20,),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          labelText: 'User Name',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          labelText: 'Email Address',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: ContactNumber,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          labelText: 'Contact Number',
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                        height: 70,
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
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
                              child: Text('Register',
                                style: TextStyle(color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          onTap: () {
                            FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text)
                                .then((value) {
                              print("Created New Account");
                              final FirebaseAuth auth = FirebaseAuth.instance;
                              final User? user = auth.currentUser;
                              final String uid = user!.uid;
                              Plan newPlan = Plan(user_id: uid, obituaryPlanID: "");
                              Users newUser = Users(user_id: uid,
                                username :  nameController.text,
                                email: emailController.text,
                                contactNumber: ContactNumber.text,);
                              saveNewUser(user: newUser, user_id: uid);
                              saveNewPlan(plan: newPlan, user_id: uid);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => HomeScreen()));
                            }).onError((error, stackTrace) {
                              print("Error ${error.toString()}");
                            });
                          },
                        )
                    ),
                  ],
                ))));
  }
}


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'homePage.dart';
// import 'package:next_stage/models/plan.dart';
// import 'package:next_stage/models/user.dart';
//
// class registerPage extends StatefulWidget {
//   const registerPage({Key? key}) : super(key: key);
//
//   @override
//   State<registerPage> createState() => _registerPageState();
// }
//
// class _registerPageState extends State<registerPage> {
//
//   TextEditingController nameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController ContactNumber = TextEditingController();
//   @override
//
//   Future saveNewPlan({required Plan plan, required String user_id}) async {
//     final docUser = FirebaseFirestore.instance.collection('Plan').doc(user_id);
//     final json = plan.getJson();
//     await docUser.set(json);
//   }
//
//   Future saveNewUser({required Users user, required String user_id}) async {
//     final docUser = FirebaseFirestore.instance.collection("User").doc(user_id);
//     final json = user.getJson();
//     await docUser.set(json);
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text('Registration Page'),
//           automaticallyImplyLeading: false,
//         ),
//         //  padding: const EdgeInsets.all(10),
//         body: Center(
//             child: ListView(
//               children: <Widget>[
//                 Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(10),
//                     child: const Text(
//                       'Registration Page',
//                       style: TextStyle(
//                           color: Colors.black54,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 23),
//                     )),
//                 Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(10),
//                     child: const Text(
//                       'Please key in your details below',
//                       style: TextStyle(fontSize: 20),
//                     )),
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   child: TextField(
//                     controller: nameController,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'User Name',
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                   child: TextField(
//                     obscureText: true,
//                     controller: passwordController,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Password',
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   child: TextField(
//                     controller: emailController,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Email Address',
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   child: TextField(
//                     controller: ContactNumber,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Contact Number',
//                     ),
//                   ),
//                 ),
//                 Container(
//                     height: 70,
//                     padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
//                     child: ElevatedButton(
//                       child: const Text('Register'),
//                       onPressed: () {
//                         FirebaseAuth.instance
//                             .createUserWithEmailAndPassword(
//                             email: emailController.text,
//                             password: passwordController.text)
//                             .then((value) {
//                           print("Created New Account");
//                           final FirebaseAuth auth = FirebaseAuth.instance;
//                           final User? user = auth.currentUser;
//                           final String uid = user!.uid;
//                           Plan newPlan = Plan(user_id: uid, obituaryPlanID: "");
//                           Users newUser = Users(user_id: uid,
//                               username :  nameController.text,
//                               email: emailController.text,
//                               contactNumber: ContactNumber.text,);
//                           saveNewUser(user: newUser, user_id: uid);
//                           saveNewPlan(plan: newPlan, user_id: uid);
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (context) => HomeScreen()));
//                         }).onError((error, stackTrace) {
//                           print("Error ${error.toString()}");
//                         });
//                       },
//                     )
//                 ),
//               ],
//             )));
//   }
// }