import 'package:flutter/material.dart';
import 'package:next_stage/models/willform.dart';
import 'package:next_stage/screens/Wills/willFilling.dart';

import '../NavBar.dart';

class WillMain extends StatefulWidget {
  static const String routeName = '/willFill';

  const WillMain({Key? key}) : super(key: key);

  @override
  _WillMainState createState() => _WillMainState();
}


class _WillMainState extends State<WillMain> {
  final trip=new Trip("","","","","","","");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Will'),
        backgroundColor: Colors.green[200],
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.all(20),
              height: 520,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Capture.png'),
                      fit: BoxFit.fitHeight
                  )
              ),
            ),
            Spacer(),
            Container(
              width: MediaQuery.of(context).size.width - 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => WillForm(trip: trip)));
                },
                child: Text(
                  'Next',
                ),
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}