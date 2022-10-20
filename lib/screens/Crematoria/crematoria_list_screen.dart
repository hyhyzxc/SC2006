import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:convert';
import 'package:next_stage/models/afterlifefacilities.dart';

import 'package:next_stage/screens/Crematoria/crematoria_detail_screen.dart';

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
        appBar: AppBar(title: Text("Crematorium and Burial Facilities"),
        backgroundColor: Colors.orange[300],),
        body:  Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(onPressed: readJsonFile,
                child: Text("Load Facilities"),
                style: ElevatedButton.styleFrom(primary: Colors.orange[300]),),
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
                        color: Colors.orange[300],
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                          leading: Container(
                              padding: EdgeInsets.only(right: 12.0),
                              decoration: new BoxDecoration(
                                  border: new Border(
                                      right: new BorderSide(width: 1.0, color: Colors.white24))),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Icon(Icons.location_city_outlined),
                              )
                          ),
                          title: Text(
                            filteredFacilities[index].name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0,5,80,0),
                                  child: Text(filteredFacilities[index].rating.toString(),
                                      style: TextStyle(color: Colors.white)),
                                ),

                              ),
                              Expanded(
                                  flex: 10,
                                  child: Padding(
                                      padding: EdgeInsets.fromLTRB(0,5,80,0),
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        // tag: 'hero',
                                        child: LinearProgressIndicator(
                                            backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                                            value: filteredFacilities[index].rating.toDouble()/5,
                                            valueColor: AlwaysStoppedAnimation(Colors.yellow[300])),
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
                            Navigator.of(context).pushNamed(CrematoriaDetails.routeName, arguments: jsonEncode(filteredFacilities[index]));
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
