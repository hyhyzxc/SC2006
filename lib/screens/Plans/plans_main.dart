import 'package:flutter/material.dart';
import 'package:next_stage/screens/DeathCert/deathcert_hospital.dart';
import 'package:next_stage/screens/DeathCert/deathcert_searchdoctor.dart';
import 'package:next_stage/screens/DeathCert/deathcert_viewcert.dart';
import 'package:next_stage/screens/Plans/crematorium_plans.dart';

class ViewPlans extends StatefulWidget {
  const ViewPlans({ Key? key }) : super(key: key);

  static const String routeName = '/plans-main';

  @override
  _ViewPlansState createState() => _ViewPlansState();
}

class _ViewPlansState extends State<ViewPlans> {

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(title: Text("View Plans"),),
          body:  Column(
              children: [
                Card(
                    margin: EdgeInsets.all(15.0),
                    color: Colors.yellow[100],
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Death Certificate"),
                      ),
                      trailing: Container(
                        child:
                        Icon(Icons.keyboard_arrow_right, color: Colors.black26),
                      ),
                      onTap: () {
                        // print(jsonEncode(products[index]));
                       // Navigator.of(context).pushNamed(DeathAtHospital.routeName);
                      },
                    )
                ),

                Card(
                    margin: EdgeInsets.all(15.0),
                    color: Colors.yellow[100],
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Obituary"),
                      ),
                      trailing: Container(
                        child:
                        Icon(Icons.keyboard_arrow_right, color: Colors.black26),
                      ),
                      onTap: () {
                        // print(jsonEncode(products[index]));
                       // Navigator.of(context).pushNamed(SearchDoctor.routeName);
                      },
                    )
                ),

                Card(
                    margin: EdgeInsets.all(15.0),
                    color: Colors.yellow[100],
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Funeral"),
                      ),
                      trailing: Container(
                        child:
                        Icon(Icons.keyboard_arrow_right, color: Colors.black26),
                      ),
                      onTap: () {
                        // print(jsonEncode(products[index]));
                       // Navigator.of(context).pushNamed(ViewCert.routeName,
                       //     arguments: "view");
                      },
                    )
                ),

                Card(
                    margin: EdgeInsets.all(15.0),
                    color: Colors.yellow[100],
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Wills"),
                      ),
                      trailing: Container(
                        child:
                        Icon(Icons.keyboard_arrow_right, color: Colors.black26),
                      ),
                      onTap: () {
                        // print(jsonEncode(products[index]));
                     //   Navigator.of(context).pushNamed(ViewCert.routeName,
                      //      arguments: "view");
                      },
                    )
                ),

                Card(
                    margin: EdgeInsets.all(15.0),
                    color: Colors.yellow[100],
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Crematoria/Burial"),
                      ),
                      trailing: Container(
                        child:
                        Icon(Icons.keyboard_arrow_right, color: Colors.black26),
                      ),
                      onTap: () {
                        // print(jsonEncode(products[index]));
                       Navigator.of(context).pushNamed(CrematoriumPlans.routeName);
                      },
                    )
                ),

                Card(
                    margin: EdgeInsets.all(15.0),
                    color: Colors.yellow[100],
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Doctor Details"),
                      ),
                      trailing: Container(
                        child:
                        Icon(Icons.keyboard_arrow_right, color: Colors.black26),
                      ),
                      onTap: () {
                        // print(jsonEncode(products[index]));
                     //   Navigator.of(context).pushNamed(ViewCert.routeName,
                      //      arguments: "view");
                      },
                    )
                ),
              ]
          )

      ),


      // else
      // Container(child: Text("No products"),)

    );
  }
}