import 'package:flutter/material.dart';


class CreateanaccountWidget extends StatefulWidget {
  @override
  _CreateanaccountWidgetState createState() => _CreateanaccountWidgetState();
}

class _CreateanaccountWidgetState extends State<CreateanaccountWidget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator CreateanaccountWidget - FRAME

    return Container(
        width: 414,
        height: 736,
        decoration: BoxDecoration(
          color : Color.fromRGBO(255, 255, 255, 1),
        ),
        child:
          Scaffold(
          // By defaut, Scaffold background is white
          // Set its value to transparent
          backgroundColor: Colors.transparent,
          appBar: AppBar(
          backgroundColor: Colors.black45,
          title: const Text('Create an Account'),
          ),
    body:Stack(
              children: <Widget>[
                Positioned(
                    top: 0,
                    left: -176,
                    child: Container(
                        width: 765,
                        height: 820,
                        decoration: BoxDecoration(
                          image : DecorationImage(
                              image: AssetImage('assets/images/Image10.png'),
                              fit: BoxFit.fitWidth
                          ),
                        )
                    )
                ),Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                        width: 414,
                        height: 736,
                        decoration: BoxDecoration(
                          color : Color.fromRGBO(0, 0, 0, 0.6499999761581421),
                        )
                    )
                ),Positioned(
                    top: 82,
                    left: 76,
                    child: Text('Create an Account', textAlign: TextAlign.center, style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.6899999976158142),
                        fontFamily: 'Helvetica',
                        fontSize: 24,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),)
                ),Positioned(
                    top: 108,
                    left: 76,
                    child: Text('Please enter your actual credentials', textAlign: TextAlign.center, style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.6899999976158142),
                        fontFamily: 'Helvetica',
                        fontSize: 15,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),)
                ),Positioned(
                    top: 265,
                    left: 57,
                    child: Text('Your password must include at least 8 characters, of which must include a digit, an uppercase letter and a lowercase letter, and a special character.', textAlign: TextAlign.center, style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.6899999976158142),
                        fontFamily: 'Helvetica',
                        fontSize: 12,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),)
                ),Positioned(
                    top: 143,
                    left: 57,
                    child: Container(
                        width: 299,
                        height: 42.79279327392578,

                        child: Stack(
                            children: <Widget>[
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                      width: 299,
                                      height: 42.79279327392578,
                                      decoration: BoxDecoration(
                                        borderRadius : BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                        boxShadow : [BoxShadow(
                                            color: Color.fromRGBO(0, 0, 0, 0.25),
                                            offset: Offset(0,4),
                                            blurRadius: 4
                                        )],
                                        color : Color.fromRGBO(217, 217, 217, 0.5400000214576721),
                                      )
                                  )
                              ),Positioned(
                                  top: 11.981982231140137,
                                  left: 19,
                                  child: Text('UserId', textAlign: TextAlign.left, style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 0.6899999976158142),
                                      fontFamily: 'Inter',
                                      fontSize: 20,
                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1
                                  ),)
                              )
                            ]
                        )
                    )
                ),Positioned(
                    top: 195.20721435546875,
                    left: 57,
                    child: Container(
                        width: 299,
                        height: 42.79279327392578,

                        child: Stack(
                            children: <Widget>[
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                      width: 299,
                                      height: 42.79279327392578,

                                      child: Stack(
                                          children: <Widget>[
                                            Positioned(
                                                top: 0,
                                                left: 0,
                                                child: Container(
                                                    width: 299,
                                                    height: 42.79279327392578,
                                                    decoration: BoxDecoration(
                                                      borderRadius : BorderRadius.only(
                                                        topLeft: Radius.circular(10),
                                                        topRight: Radius.circular(10),
                                                        bottomLeft: Radius.circular(10),
                                                        bottomRight: Radius.circular(10),
                                                      ),
                                                      color : Color.fromRGBO(217, 217, 217, 0.5400000214576721),
                                                    )
                                                )
                                            ),Positioned(
                                                top: 10.270262718200684,
                                                left: 19,
                                                child: Text('Password', textAlign: TextAlign.left, style: TextStyle(
                                                    color: Color.fromRGBO(255, 255, 255, 0.6899999976158142),
                                                    fontFamily: 'Inter',
                                                    fontSize: 20,
                                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                    fontWeight: FontWeight.normal,
                                                    height: 1
                                                ),)
                                            )
                                          ]
                                      )
                                  )
                              ),
                            ]
                        )
                    )
                ),Positioned(
                    top: 325,
                    left: 57,
                    child: Container(
                        width: 299,
                        height: 43.099998474121094,

                        child: Stack(
                            children: <Widget>[
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                      width: 299,
                                      height: 43,

                                      child: Stack(
                                          children: <Widget>[
                                            Positioned(
                                                top: 0,
                                                left: 0,
                                                child: Container(
                                                    width: 299,
                                                    height: 43,
                                                    decoration: BoxDecoration(
                                                      borderRadius : BorderRadius.only(
                                                        topLeft: Radius.circular(10),
                                                        topRight: Radius.circular(10),
                                                        bottomLeft: Radius.circular(10),
                                                        bottomRight: Radius.circular(10),
                                                      ),
                                                      color : Color.fromRGBO(217, 217, 217, 0.5400000214576721),
                                                    )
                                                )
                                            )
                                          ]
                                      )
                                  )
                              ),Positioned(
                                  top: 13,
                                  left: 19,
                                  child: Text('Reenter your Password', textAlign: TextAlign.left, style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 0.6899999976158142),
                                      fontFamily: 'Inter',
                                      fontSize: 15,
                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1
                                  ),)
                              ),
                            ]
                        )
                    )
                ),Positioned(
                    top: 325,
                    left: 57,
                    child: Container(
                        width: 299,
                        height: 43.099998474121094,

                        child: Stack(
                            children: <Widget>[
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                      width: 299,
                                      height: 43,

                                      child: Stack(
                                          children: <Widget>[
                                            Positioned(
                                                top: 0,
                                                left: 0,
                                                child: Container(
                                                    width: 299,
                                                    height: 43,
                                                    decoration: BoxDecoration(
                                                      borderRadius : BorderRadius.only(
                                                        topLeft: Radius.circular(10),
                                                        topRight: Radius.circular(10),
                                                        bottomLeft: Radius.circular(10),
                                                        bottomRight: Radius.circular(10),
                                                      ),
                                                      color : Color.fromRGBO(217, 217, 217, 0.5400000214576721),
                                                    )
                                                )
                                            )
                                          ]
                                      )
                                  )
                              ),Positioned(
                                  top: 13,
                                  left: 19,
                                  child: Text('Reenter your Password', textAlign: TextAlign.left, style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 0.6899999976158142),
                                      fontFamily: 'Inter',
                                      fontSize: 15,
                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1
                                  ),)
                              ),
                            ]
                        )
                    )
                ),Positioned(
                    top: 325,
                    left: 57,
                    child: Container(
                        width: 299,
                        height: 43.099998474121094,

                        child: Stack(
                            children: <Widget>[
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                      width: 299,
                                      height: 43,

                                      child: Stack(
                                          children: <Widget>[
                                            Positioned(
                                                top: 0,
                                                left: 0,
                                                child: Container(
                                                    width: 299,
                                                    height: 43,
                                                    decoration: BoxDecoration(
                                                      borderRadius : BorderRadius.only(
                                                        topLeft: Radius.circular(10),
                                                        topRight: Radius.circular(10),
                                                        bottomLeft: Radius.circular(10),
                                                        bottomRight: Radius.circular(10),
                                                      ),
                                                      color : Color.fromRGBO(217, 217, 217, 0.5400000214576721),
                                                    )
                                                )
                                            )
                                          ]
                                      )
                                  )
                              ),Positioned(
                                  top: 13,
                                  left: 19,
                                  child: Text('Reenter your Password', textAlign: TextAlign.left, style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 0.6899999976158142),
                                      fontFamily: 'Inter',
                                      fontSize: 15,
                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1
                                  ),)
                              ),
                            ]
                        )
                    )
                ),Positioned(
                    top: 378,
                    left: 57,
                    child: Container(
                        width: 302,
                        height: 43,
                        decoration: BoxDecoration(
                          borderRadius : BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          image : DecorationImage(
                              image: AssetImage('assets/images/Screenshot20220831at4171.png'),
                              fit: BoxFit.fitWidth
                          ),
                        )
                    )
                ),Positioned(
                    top: 613,
                    left: 57,
                    child: Container(
                        width: 299,
                        height: 50,

                        child: Stack(
                            children: <Widget>[
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                      width: 299,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius : BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                        color : Color.fromRGBO(65, 128, 148, 0.7799999713897705),
                                      )
                                  )
                              ),
                            ]
                        )
                    )
                ),Positioned(
                    top: 613,
                    left: 57,
                    child: Container(
                        width: 299,
                        height: 50,

                        child: Stack(
                            children: <Widget>[
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                      width: 299,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius : BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                        color : Color.fromRGBO(65, 128, 148, 0.7799999713897705),
                                      )
                                  )
                              ),Positioned(
                                  top: 12,
                                  left: 19,
                                  child: Text('Next', textAlign: TextAlign.center, style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 0.6899999976158142),
                                      fontFamily: 'Inter',
                                      fontSize: 20,
                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1
                                  ),)
                              ),
                            ]
                        )
                    )
                ),
              ]
          ),

    )
    );
  }
}

