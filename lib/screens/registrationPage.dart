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

  final GlobalKey<FormState> _key=GlobalKey<FormState>();

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
                    Form(
                      key: _key,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: nameController,
                              validator: validateName,
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
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: emailController,
                              validator: validateEmail,
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
                            child: TextFormField(
                              controller: ContactNumber,
                              validator: validateNumber,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                labelText: 'Contact Number',
                              ),
                            ),
                          ),
                        ],
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
                            if (_key.currentState!.validate()) {
                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text)
                                  .then((value) {
                                print("Created New Account");
                                final FirebaseAuth auth = FirebaseAuth.instance;
                                final User? user = auth.currentUser;
                                final String uid = user!.uid;
                                Plan newPlan = Plan(
                                    user_id: uid, obituaryPlanID: "");
                                Users newUser = Users(user_id: uid,
                                  username: nameController.text,
                                  email: emailController.text,
                                  contactNumber: ContactNumber.text,);
                                saveNewUser(user: newUser, user_id: uid);
                                saveNewPlan(plan: newPlan, user_id: uid);
                                Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                              }).onError((error, stackTrace) {

                                print("Error ${error.toString()}");
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Login fail"),
                                      content: Text(error.toString()),
                                      actions: [
                                        TextButton(
                                          child: Text("Close"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    );
                                  },
                                );
                              });
                            }
                          },
                        )
                    ),
                  ],
                ))));
  }
}

String? validateName(String? formName) {
  if (formName==null || formName.isEmpty) {
    return "Username required";
  }
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

String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return 'E-mail address required';
  }
  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) return 'Invalid E-mail Address format.';
  return null;
}

String? validateNumber(String? formNumber) {
  if (formNumber == null || formNumber.isEmpty) {
    return 'Phone number required';
  }
  String pattern =
      r'^[8|9]\d{7}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formNumber))
    return '''
      Please enter a valid Singapore phone number
      ''';
  return null;
}



