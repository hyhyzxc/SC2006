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
          appBar: AppBar(title: Text("Location of Death"),),
          body:  Column(
              children: [
                Card(
                    margin: EdgeInsets.all(15.0),
                    color: Colors.yellow[100],
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
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

                Card(
                    margin: EdgeInsets.all(15.0),
                    color: Colors.yellow[100],
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
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

                Card(
                    margin: EdgeInsets.all(15.0),
                    color: Colors.yellow[100],
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("View Past Death Certificate(s)"),
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
              ]
          )

      ),


      // else
      // Container(child: Text("No products"),)

    );
  }
}