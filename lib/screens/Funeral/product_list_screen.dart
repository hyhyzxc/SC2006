import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:convert';
import 'package:next_stage/models/funeralparlor.dart';

import 'package:next_stage/screens/Funeral/product_detail_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({ Key? key }) : super(key: key);

  static const String routeName = '/product-list';

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  List<FuneralParlor> allProducts = [];
  List<FuneralParlor> filteredProducts = [];

  Future<void> readJsonFile() async {

    final String response = await rootBundle.loadString('assets/funeralplace.json'); //change file
    final productData = await json.decode(response);

    var list = productData["places"] as List<dynamic>;

    setState(() {
      allProducts = [];
      allProducts = list.map((e) => FuneralParlor.fromJson(e)).toList();
      filteredProducts = allProducts;
    });  //initial state

  }

  void _runFilter(String searchKeyword) {
    List<FuneralParlor> results = [];

    if(searchKeyword.isEmpty) {
      results = allProducts;
    } else {
      results = allProducts.where((element) => element.name.toLowerCase().contains(searchKeyword.toLowerCase())).toList();
    }

    // refresh the UI
    setState(() {
      filteredProducts = results;
    });

  }


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: Text("Funeral Parlours"),),
        body:  Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(onPressed: readJsonFile, child: Text("Load Locations")),
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
                itemCount: filteredProducts.length,
                itemBuilder: (BuildContext context, index) {
                  return Dismissible(
                    key: ValueKey(filteredProducts[index].id),
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
                        filteredProducts.removeAt(index);
                      }

                    },
                    child: Card(
                        margin: EdgeInsets.all(15.0),
                        color: Colors.blue[100],
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                          leading: Container(
                              padding: EdgeInsets.only(right: 12.0),
                              decoration: new BoxDecoration(
                                  border: new Border(
                                      right: new BorderSide(width: 1.0, color: Colors.white24))),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Icon(Icons.location_city_outlined, color: Colors.blueGrey),
                              )
                          ),
                          title: Text(
                            filteredProducts[index].name,
                            style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0,5,80,0),
                                  child: Text(filteredProducts[index].rating.toString(),
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
                                            value: filteredProducts[index].rating.toDouble()/5,
                                            valueColor: AlwaysStoppedAnimation(Colors.yellow[700])),
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
                            Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments: jsonEncode(filteredProducts[index]));
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