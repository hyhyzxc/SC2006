import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:next_stage/models/afterlifefacilities.dart';
import 'package:next_stage/screens/Crematoria/crematoria_detail_screen.dart';

import '../NavBar.dart';

class Crematoria extends StatefulWidget {
  const Crematoria({Key? key}) : super(key: key);
  static const String routeName = '/crematoria-list';
  @override
  State<Crematoria> createState() => _CrematoriaState();
}

class _CrematoriaState extends State<Crematoria> {
  List<AfterLifeFacilities> allFacilities = [];
  List<AfterLifeFacilities> filteredFacilities = [];

  Future<void> readJsonFile() async {

    final String response = await rootBundle.loadString('assets/AfterLifeFacilities.json'); //change file
    final facilitiesData = await json.decode(response);

    var list = facilitiesData['facilities'] as List<dynamic>;

    setState(() {
      allFacilities = [];
      allFacilities = list.map((e) => AfterLifeFacilities.fromJson(e)).toList();
      filteredFacilities = allFacilities;
    });  //initial state

  }

  void _runFilter(String searchKeyword) {
    List<AfterLifeFacilities> results = [];

    if(searchKeyword.isEmpty) {
      results = allFacilities;
    } else {
      results = allFacilities.where((element) => element.name.toLowerCase().contains(searchKeyword.toLowerCase())).toList();
    }

    // refresh the UI
    setState(() {
      filteredFacilities = results;
    });

  }


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        drawer: NavBar(),
        appBar: AppBar(title: Text("Crematorium and Burial Facilities"),
        backgroundColor: Colors.orange[200],),
        body:  Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(onPressed: readJsonFile,
                child: Text("Load Facilities"),
                style: ElevatedButton.styleFrom(primary: Colors.orange[200]),),
            ),
            // if (allProducts.length > 0)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  TextField(
                    onChanged: (value) => _runFilter(value),
                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),),labelText: 'Search', suffixIcon: Icon(Icons.search)),
                  ),
                  SizedBox(height: 10,),
                ],
              ),

            ),


            Expanded(

              child: ListView.builder(
                shrinkWrap: true,
                itemCount: filteredFacilities.length,
                itemBuilder: (BuildContext context, index) {
                  return Dismissible(
                    key: ValueKey(filteredFacilities[index].id),
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
                        filteredFacilities.removeAt(index);
                      }

                    },
                    child: Card(
                        margin: EdgeInsets.all(15.0),
                        color: Colors.orange[200],
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                          leading: Container(
                              padding: EdgeInsets.only(right: 12.0),
                              decoration: new BoxDecoration(
                                  border: new Border(
                                      right: new BorderSide(width: 1.0, color: Colors.white24))),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Icon(Icons.location_city_outlined, color: Colors.orange[500],),
                              )
                          ),
                          title: Text(
                            filteredFacilities[index].name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                children: <Widget>[
                                  for(int x = filteredFacilities[index].rating; x>0; x--)...[
                                    Container(
                                      child: Icon(Icons.star, color: Colors.yellow[200],),
                                    ),
                                  ],
                                ],
                              )),
                          trailing: Container(
                              child: Padding(
                                child: Icon(Icons.keyboard_arrow_right, color: Colors.black26,size: 30.0),
                                padding: const EdgeInsets.all(8.0),
                              )
                          ),
                          onTap: () {
                            // print(jsonEncode(products[index]));
                            Navigator.of(context).pushNamed(CrematoriaDetails.routeName, arguments: jsonEncode(filteredFacilities[index]));
                          },
                        )
                    ),
                  );
                },
              ),

            ),
            SizedBox(height: 30,)
          ],
        ),

      ),
    );
  }
}
