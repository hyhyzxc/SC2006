import 'package:flutter/material.dart';
import 'package:next_stage/screens/DeathCert/deathcert_hospital.dart';
import 'package:next_stage/screens/DeathCert/deathcert_searchdoctor.dart';
import 'package:next_stage/screens/DeathCert/deathcert_viewcert.dart';

class DeathCertMain extends StatefulWidget {
  const DeathCertMain({ Key? key }) : super(key: key);

  static const String routeName = '/deathcert-main';

  @override
  _DeathCertMainState createState() => _DeathCertMainState();
}

class _DeathCertMainState extends State<DeathCertMain> {

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(title: Text("Location of Death"),
          backgroundColor: Colors.indigo[100],),
          body:  Column(
              children: [
                Container(
                    height: 100,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(15.0),
                    color: Colors.indigo[50],
                    child: ListTile(
                      leading: Container(
                          padding: EdgeInsets.only(right: 0),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Icon(Icons.health_and_safety_outlined),
                          )
                      ),
                      title: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Text("Instructions of Death at Hospital"),
                      ),
                      trailing: Container(
                        child:
                        Icon(Icons.keyboard_arrow_right, color: Colors.black26),
                      ),
                      onTap: () {
                        // print(jsonEncode(products[index]));
                        Navigator.of(context).pushNamed(DeathAtHospital.routeName);
                      },
                    )
                ),

                Container(
                    height: 100,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(15.0),
                    color: Colors.indigo[50],
                    child: ListTile(
                      leading: Container(
                          padding: EdgeInsets.only(right: 0),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Icon(Icons.house_outlined),
                          )
                      ),
                      title: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Text("Instructions of Death at Home"),
                      ),
                      trailing: Container(
                        child:
                        Icon(Icons.keyboard_arrow_right, color: Colors.black26),
                      ),
                      onTap: () {
                        // print(jsonEncode(products[index]));
                        Navigator.of(context).pushNamed(SearchDoctor.routeName);
                      },
                    )
                ),

                Container(
                    height: 100,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(15.0),
                    color: Colors.indigo[50],
                    child: ListTile(
                      leading: Container(
                          padding: EdgeInsets.only(right: 0),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Icon(Icons.remove_red_eye_outlined),
                          )
                      ),
                      title: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Text("View Past Death Certificate(s)"),
                      ),
                      trailing: Container(
                        child:
                        Icon(Icons.keyboard_arrow_right, color: Colors.black26),
                      ),
                      onTap: () {
                        // print(jsonEncode(products[index]));
                        Navigator.of(context).pushNamed(ViewCert.routeName,
                            arguments: "view");
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