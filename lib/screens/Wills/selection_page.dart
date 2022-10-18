import 'package:flutter/material.dart';
import 'package:next_stage/screens/Wills/lawyers_search.dart';
import 'package:next_stage/screens/Wills/will_main.dart';

class WillSelection extends StatefulWidget {
  const WillSelection({ Key? key }) : super(key: key);

  static const String routeName = '/selection-page';

  @override
  _WillSelectionState createState() => _WillSelectionState();
}

class _WillSelectionState extends State<WillSelection> {

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(title: Text("Wills"),),
          body:  Column(
              children: [
                Card(
                    margin: EdgeInsets.all(15.0),
                    color: Colors.yellow[100],
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Make Will"),
                      ),
                      trailing: Container(
                        child:
                        Icon(Icons.keyboard_arrow_right, color: Colors.black26),
                      ),
                      onTap: () {
                        // print(jsonEncode(products[index]));
                        Navigator.of(context).pushNamed(WillMain.routeName);
                      },
                    )
                ),

                Card(
                    margin: EdgeInsets.all(15.0),
                    color: Colors.yellow[100],
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("View Lawyers"),
                      ),
                      trailing: Container(
                        child:
                        Icon(Icons.keyboard_arrow_right, color: Colors.black26),
                      ),
                      onTap: () {
                        // print(jsonEncode(products[index]));
                        Navigator.of(context).pushNamed(SearchLawyer.routeName);
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