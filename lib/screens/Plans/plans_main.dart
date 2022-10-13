import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:next_stage/models/deathcert_doctor.dart';
import 'package:next_stage/models/funeralparlor.dart';
import 'package:next_stage/screens/DeathCert/deathcert_doctordetail.dart';
import 'package:next_stage/screens/Obituary/obituary_form.dart';
import 'dart:convert';
/**/
import '../../models/obituaryPlan.dart';
import '../../models/plan.dart';

class ViewPlans extends StatefulWidget {
  const ViewPlans({ Key? key }) : super(key: key);

  static const String routeName = '/search-doctor';

  @override
  _ViewPlansState createState() => _ViewPlansState();
}

class _ViewPlansState extends State<ViewPlans> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  List<DeathCertDoctor> allProducts = [];
  List<DeathCertDoctor> filteredProducts = [];

  Future<Plan?> getPlan() async {
    final User? user = auth.currentUser;
    final String uid = user!.uid;
    final planData = FirebaseFirestore.instance.collection('Plan').doc(uid);
    final snapshot = await planData.get();

    if(snapshot.exists) {
      return Plan.fromJson(snapshot.data()!);
    }
  }

  /*Widget displayObituaryPlan(ObituaryPlan obituaryPlan) => ListTile(
    leading: CircleAvatar();
    title:
  )*/
  Future<void> readJsonFile() async {

    final String response = await rootBundle.loadString('assets/deathcert_doctor.json'); //change file
    final productData = await json.decode(response);

    var list = productData["doctors"] as List<dynamic>;

    setState(() {
      allProducts = [];
      allProducts = list.map((e) => DeathCertDoctor.fromJson(e)).toList();
      filteredProducts = allProducts;
    });  //initial state

  }

  void _runFilter(String searchKeyword) {
    List<DeathCertDoctor> results = [];

    if(searchKeyword.isEmpty) {
      results = allProducts;
    } else {
      results = allProducts.where((element) => element.name.toLowerCase().contains(searchKeyword.toLowerCase())).toList();
    }

    // refresh the UI
    setState(() {
      filteredProducts = results;
    });

  }


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: Text("View plans"),),
        body:  Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(onPressed: readJsonFile, child: Text("View all plans")),
            ),
            // if (allProducts.length > 0)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  TextField(
                    onChanged: (value) => _runFilter(value),
                    decoration: InputDecoration(labelText: 'Search', suffixIcon: Icon(Icons.search)),
                  ),
                  SizedBox(height: 10,),
                ],
              ),

            ),


            Expanded(

              child: ListView.builder(
                shrinkWrap: true,
                itemCount: filteredProducts.length,
                itemBuilder: (BuildContext context, index) {
                  return Dismissible(
                    key: ValueKey(filteredProducts[index].id),
                    background: Container(
                      color: Colors.redAccent,
                      child: Icon(Icons.delete, color: Colors.white, size: 40),
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(8.0),
                    ),
                    direction: DismissDirection.endToStart,
                    confirmDismiss: (direction) {

                      return showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text("Please Confirm"),
                          content: Text("Are you sure you want to delete?"),
                          actions: [
                            ElevatedButton(onPressed: (){
                              Navigator.of(ctx).pop(false);
                            }, child: Text("Cancel")),
                            ElevatedButton(onPressed: (){
                              Navigator.of(ctx).pop(true);
                            }, child: Text("Delete")),
                          ],
                        ),
                      );


                    },
                    onDismissed: (DismissDirection direction) {

                      if(direction == DismissDirection.endToStart) {
                        filteredProducts.removeAt(index);
                      }

                    },
                    child: Card(
                        margin: EdgeInsets.all(15.0),
                        color: Colors.blue[100],
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                          leading: Container(
                              padding: EdgeInsets.only(right: 12.0),
                              decoration: new BoxDecoration(
                                  border: new Border(
                                      right: new BorderSide(width: 1.0, color: Colors.white24))),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Icon(Icons.location_city, color: Colors.blueGrey),
                              )
                          ),
                          title: Text(
                            filteredProducts[index].name,
                            style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),
                          ),
                          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                          // subtitle: Row(
                          //   children: <Widget>[
                          //     Icon(Icons.linear_scale, color: Colors.yellow[500]),
                          //     Text(filteredProducts[index].rating.toString(), style: TextStyle(color: Colors.blueGrey))
                          //   ],
                          // ),

                          subtitle: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Text(filteredProducts[index].rating.toString(),
                                    style: TextStyle(color: Colors.white)),
                              ),
                              Expanded(
                                  flex: 10,
                                  child: Padding(
                                      padding: EdgeInsets.only(right: 80.0),
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        // tag: 'hero',
                                        child: LinearProgressIndicator(
                                            backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                                            value: filteredProducts[index].rating.toDouble()/5,
                                            valueColor: AlwaysStoppedAnimation(Colors.yellow[700])),
                                      )
                                  )
                              )
                            ],
                          ),
                          trailing: Container(
                              child: Padding(
                                child: Icon(Icons.keyboard_arrow_right, color: Colors.black26,size: 30.0),
                                padding: const EdgeInsets.all(8.0),
                              )
                          ),
                          onTap: () {
                            // print(jsonEncode(products[index]));
                            Navigator.of(context).pushNamed(DoctorDetail.routeName, arguments: jsonEncode(filteredProducts[index]));
                          },
                        )
                    ),
                  );
                },
              ),

            ),
            SizedBox(height: 30,)

            // else
            // Container(child: Text("No products"),)

          ],
        ),

      ),
    );
  }
}