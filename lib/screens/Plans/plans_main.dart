import 'package:flutter/material.dart';
import 'package:next_stage/screens/Plans/crematorium_plans.dart';
import 'package:next_stage/screens/Plans/will_plans.dart';
import '../NavBar.dart';
import 'deathcert_plans.dart';
import 'funeral_plans.dart';
import 'obituary_plans.dart';

class ViewPlans extends StatefulWidget {
  const ViewPlans({ Key? key }) : super(key: key);

  static const String routeName = '/plans-trial';

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
          drawer: NavBar(),
          appBar: AppBar(title: Text("Plans"),
            backgroundColor: Colors.blueGrey[300],),
          body:  Column(
              children: [

                Container(
                    height: 100,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(15.0),
                    color: Colors.blueGrey[300],
                    child: ListTile(
                      leading: Container(
                          padding: EdgeInsets.only(right: 0),
                          child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Icon(Icons.person_outline,
                              )
                          )),
                      title: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Text("Will"),
                      ),
                      trailing: Container(
                        child:
                        Icon(Icons.keyboard_arrow_right, color: Colors.black26),
                      ),
                      onTap: () => Navigator.push(
                          context, MaterialPageRoute(builder: (context) => PlansWill())),
                    )
                ),

                Container(
                    height: 100,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(15.0),
                    color: Colors.blueGrey[300],
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
                        child: Text("Death Certificate Doctors"),
                      ),
                      trailing: Container(
                        child:
                        Icon(Icons.keyboard_arrow_right, color: Colors.black26),
                      ),
                      onTap: () => Navigator.push(
                          context, MaterialPageRoute(builder: (context) => PlansDeathCert())),
                    )
                ),

                Container(
                    height: 100,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(15.0),
                    color: Colors.blueGrey[300],
                    child: ListTile(
                      leading: Container(
                          padding: EdgeInsets.only(right: 0),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Icon(Icons.newspaper_outlined),
                          )
                      ),
                      title: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Text("Obituary"),
                      ),
                      trailing: Container(
                        child:
                        Icon(Icons.keyboard_arrow_right, color: Colors.black26),
                      ),
                      onTap: () => Navigator.push(
                          context, MaterialPageRoute(builder: (context) => PlansObituary())),
                    )
                ),

                Container(
                    height: 100,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(15.0),
                    color: Colors.blueGrey[300],
                    child: ListTile(
                      leading: Container(
                          padding: EdgeInsets.only(right: 0),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Icon(Icons.location_city_outlined),
                          )
                      ),
                      title: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Text("Crematoria"),
                      ),
                      trailing: Container(
                        child:
                        Icon(Icons.keyboard_arrow_right, color: Colors.black26),
                      ),
                      onTap: () => Navigator.push(
                          context, MaterialPageRoute(builder: (context) => PlansCrematoria())),
                    )
                ),

                Container(
                    height: 100,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(15.0),
                    color: Colors.blueGrey[300],
                    child: ListTile(
                      leading: Container(
                          padding: EdgeInsets.only(right: 0),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Icon(Icons.location_city_outlined),
                          )
                      ),
                      title: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Text("Funeral"),
                      ),
                      trailing: Container(
                        child:
                        Icon(Icons.keyboard_arrow_right, color: Colors.black26),
                      ),
                      onTap: () => Navigator.push(
                          context, MaterialPageRoute(builder: (context) => PlansFuneral())),
                    )
                ),
              ]
          )
      ),
    );
  }
}