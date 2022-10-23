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
          appBar: AppBar(title: Text("Will"),
            backgroundColor: Colors.green[200],),
          body:  Column(
              children: [
                Container(
                    height: 100,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(15.0),
                    color: Colors.green[100],
                    child: ListTile(
                      leading: Container(
                          padding: EdgeInsets.only(right: 0),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Icon(Icons.edit_note_outlined),
                          )
                      ),
                      title: Padding(
                        padding: const EdgeInsets.all(0),
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

                Container(
                    height: 100,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(15.0),
                    color: Colors.green[100],
                    child: ListTile(
                      leading: Container(
                          padding: EdgeInsets.only(right: 0),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Icon(Icons.balance_outlined),
                          )
                      ),
                      title: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Text("Search Lawyer"),
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