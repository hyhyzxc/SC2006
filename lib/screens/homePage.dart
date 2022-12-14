import 'package:flutter/material.dart';
import 'package:next_stage/screens/DeathCert/deathcert_main.dart';
import 'package:next_stage/screens/NavBar.dart';
import 'package:next_stage/screens/Obituary/obituary_form.dart';
import 'package:next_stage/screens/Plans/plans_main.dart';
import 'package:next_stage/screens/Wills/selection_page.dart';
import '../models/obituaryform.dart';
import 'Crematoria/crematoria_list_screen.dart';
<<<<<<< Updated upstream
import 'Funeral/funeral_list.dart';
=======
import 'Funeral/FuneralList.dart';
>>>>>>> Stashed changes

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final newTrip = new obiTrip("","","","","","","","");
  final newNewspaper = new NewspaperData(0,"","","");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('MENU'),
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.cover
                    )
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                            Colors.black.withOpacity(.4),
                            Colors.black.withOpacity(.2),
                          ]
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(height: 80,),
                      Text("Welcome To", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text("NextStage", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'CatalishHuntera'),),
                      SizedBox(height: 80,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Expanded(
                child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 30,
                    children:[
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context, MaterialPageRoute(builder: (context) => WillSelection())),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          child: Column(children:[
                            Image.asset(
                              'assets/images/will.png',
                              height: 49,
                              width: 49,
                              fit:BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                            SizedBox(height: 5,),
                            Text("Will")
                          ]),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context, MaterialPageRoute(builder: (context) => DeathCertMain())),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          child: Column(children:[
                            Image.asset(
                              'assets/images/deathcertificate.png',
                              height: 49,
                              width: 49,
                              fit:BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                            SizedBox(height: 5,),
                            Text("Document")
                          ]),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context, MaterialPageRoute(builder: (context) => ObituaryForm(trip: newTrip, newspaper: newNewspaper))),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          child: Column(children:[
                            Image.asset(
                              'assets/images/newspaper.png',
                              height: 49,
                              width: 49,
                              fit:BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                            SizedBox(height: 5,),
                            Text("Obituary")
                          ]),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context, MaterialPageRoute(builder: (context) => Crematoria())),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          child: Column(children:[
                            Image.asset(
                              'assets/images/burial.png',
                              height: 49,
                              width: 49,
                              fit:BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                            SizedBox(height: 5,),
                            Text("Crematoria")
                          ]),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context, MaterialPageRoute(builder: (context) => ProductListScreen())),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          child: Column(children:[
                            Image.asset(
                              'assets/images/funeral.png',
                              height: 49,
                              width: 49,
                              fit:BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                            SizedBox(height: 5,),
                            Text("Funeral")
                          ]),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context, MaterialPageRoute(builder: (context) => ViewPlans())),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          child: Column(children:[
                            Image.asset(
                              'assets/images/plan.png',
                              height: 49,
                              width: 49,
                              fit:BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                            SizedBox(height: 5,),
                            Text("Plans")
                          ]),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                          ),
                        ),
                      ),
                    ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
<<<<<<< Updated upstream
}
=======
}
>>>>>>> Stashed changes
