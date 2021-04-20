import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';


BuildContext contextTest = _DashBoardState().context;
String _responseFromNativeCode = 'Waiting for Response...';
int response = 0;
final _text = TextEditingController();
String transaction;



void _modalBottomSheetMenuPay(BuildContext context){
  void twoInOne(){
    transaction = _text.text.toString();
    Navigator.pop(context);
    doTransactionPay("Transaction Amount",_text.text.toString());
  }
  showModalBottomSheet(
    isScrollControlled: true,
      context: context,
      builder: (builder){
        return SingleChildScrollView(//could change this to Color(0xFF737373),
          //so you don't have to change MaterialApp canvasColor
          child: new Container(
            padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(10.0),
                      topRight: const Radius.circular(10.0))),
              child: new Center(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 300,
                      height: 150,
                      child: Image.asset('assets/images/payAmount.jpeg'),
                    ),
                    Theme(
                      data: ThemeData(
                        primaryColor: Colors.black,
                        primaryColorDark: Colors.black,
                      ),
                      child: Container(
                        child: TextField(
                          controller: _text,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                                color: Colors.black
                            ),
                            hintStyle: TextStyle(
                                color: Colors.black
                            ),
                            prefixIcon: new Container(
                              height: 15,
                              width: 15,
                              child: Image.asset('assets/images/rupee.jpg'),
                            ),
                            border: OutlineInputBorder(),
                            labelText: 'Enter the amount to pay',
                          ),
                        ),
                        margin: EdgeInsets.only(left: 50,right: 50,top: 20),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 20,bottom: 50,right: 50,left: 50),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        color: Colors.lightBlueAccent,
                        disabledColor: Colors.lightBlueAccent,
                        elevation: 5,
                        onPressed: () {
                          _text.text.isEmpty?Fluttertoast.showToast(
                              msg: "Amount can't be empty",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.SNACKBAR,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.redAccent,
                              textColor: Colors.white,
                              fontSize: 16.0
                          ):twoInOne();
                        },
                        child: Text("PAY",
                          style: TextStyle(fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                  ]
              ),
              ),
          ),
        );
      }
  );
}



void _modalBottomSheetMenuConfirm(BuildContext context,String text1,String text2){
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (builder){
        return SingleChildScrollView(//could change this to Color(0xFF737373),
          //so you don't have to change MaterialApp canvasColor
          child: new Container(
            padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0))),
            child: new Center(
              child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 300,
                      height: 150,
                      child: Image.asset('assets/images/paySuccess.jpeg'),
                    ),
                    SizedBox(height: 20,),
                    Text("Payment of \u{20B9} $transaction.00 paid",
                      style: TextStyle(fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                    SizedBox(height: 5,),
                    Text("Successfully...",
                      style: TextStyle(fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10),
                      child: Text("CARD NO: $text1",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            fontSize: 15,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10),
                      child: Text("EXP DATE: $text2",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            fontSize: 15,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 20,bottom: 50,right: 50,left: 50),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        color: Colors.lightBlueAccent,
                        disabledColor: Colors.lightBlueAccent,
                        elevation: 5,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("DONE",
                          style: TextStyle(fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                  ]
              ),
            ),
          ),
        );
      }
  );
}

void _modalBottomSheetMenuBalance(BuildContext context,String text1, String text2) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (builder) {
        return SingleChildScrollView( //could change this to Color(0xFF737373),
          //so you don't have to change MaterialApp canvasColor
          child: new Container(
            padding:
            EdgeInsets.only(bottom: MediaQuery
                .of(context)
                .viewInsets
                .bottom),
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0))),
            child: new Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 300,
                      height: 150,
                      child: Image.asset('assets/images/balance.jpeg'),
                    ),
                    SizedBox(height: 20,),
                    Text("Bank balance fetch successful.",
                      style: TextStyle(fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                    SizedBox(height: 5,),
                    Text("\u{20B9} 20000.00",
                      style: TextStyle(fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 25,
                          color: Colors.black),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Text("CARD NO: $text1",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            fontSize: 15,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Text("EXP DATE: $text2",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            fontSize: 15,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      margin: EdgeInsets.only(
                          top: 20, bottom: 50, right: 50, left: 50),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        color: Colors.lightBlueAccent,
                        disabledColor: Colors.lightBlueAccent,
                        elevation: 5,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("DONE",
                          style: TextStyle(fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                  ]
              ),
            ),
          ),
        );
      }
  );
}

void _modalBottomSheetMenuFailed(BuildContext context) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (builder) {
        return SingleChildScrollView( //could change this to Color(0xFF737373),
          //so you don't have to change MaterialApp canvasColor
          child: new Container(
            padding:
            EdgeInsets.only(bottom: MediaQuery
                .of(context)
                .viewInsets
                .bottom),
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0))),
            child: new Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 300,
                      height: 150,
                      child: Image.asset('assets/images/failed.jpeg'),
                    ),
                    SizedBox(height: 20,),
                    Text("Failed...!!!",
                      style: TextStyle(fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Text("Try again after some times...",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            fontSize: 15,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      margin: EdgeInsets.only(
                          top: 20, bottom: 50, right: 50, left: 50),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        color: Colors.lightBlueAccent,
                        disabledColor: Colors.lightBlueAccent,
                        elevation: 5,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("OK",
                          style: TextStyle(fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                  ]
              ),
            ),
          ),
        );
      }
  );
}

Future<dynamic> handlePlatformChannelMethods() async {
  platform.setMethodCallHandler((methodCall) async {
    if (methodCall.method == "pay") {
      String text = methodCall.arguments;
      List<String> message = text.split(',');
      String text1 = message[0].substring(0,4)+" "+message[0].substring(4,8)+" "+message[0].substring(8,12)+" "+message[0].substring(12,16);
      String text2 = message[1].substring(0,2)+"/"+message[1].substring(2,4);
     _modalBottomSheetMenuConfirm(contextTest,text1,text2);
    }
    else if (methodCall.method == "balance") {
      String text = methodCall.arguments;
      List<String> message = text.split(',');
      String text1 = message[0].substring(0,4)+" "+message[0].substring(4,8)+" "+message[0].substring(8,12)+" "+message[0].substring(12,16);
      String text2 = message[1].substring(0,2)+"/"+message[1].substring(2,4);
      _modalBottomSheetMenuBalance(contextTest,text1,text2);
    }else if(methodCall.method == "failed"){
      _modalBottomSheetMenuFailed(contextTest);
    }
  }
  );
}


const platform = const MethodChannel('flutter.native/helper');


Future<void> doTransactionPay(text1,text2) async {
  try {
    final int result = await platform.invokeMethod('doTransactionPay',{"text1":text1,"text2":text2});
      } on PlatformException catch (e) {
    print(e.message);
      }
}

Future<void> doTransactionBalance(text3) async {
  try {
    await platform.invokeMethod('doTransactionBalance',{"text3":text3});
  } on PlatformException catch (e) {

  }
}


class DashBoard extends StatefulWidget{
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);


  initState(){
    super.initState();
    handlePlatformChannelMethods();
  }

  Future<void> responseFromNativeCode() async {
    String response = "";
    try {
      final String result = await platform.invokeMethod('helloFromNativeCode');
      response = result;
    } on PlatformException catch (e) {
      response = "Failed to Invoke: '${e.message}'.";
    }
    setState(() {
      _responseFromNativeCode = response;
    });
  }




  // List<Widget> _widgetOptions = <Widget>[
  //   Container(
  //     padding: EdgeInsets.all(50),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         GestureDetector(
  //           onTap: () {
  //             doTransaction();
  //           },
  //           child: CircleAvatar(
  //             backgroundColor: Colors.redAccent,
  //             radius: 55,
  //             child: Container(
  //               color: Colors.redAccent,
  //               margin: EdgeInsets.all(15),
  //               child: Text(
  //                 "PAY",
  //                 style: TextStyle(color: Colors.white,
  //                     fontWeight: FontWeight.bold,
  //                     fontStyle: FontStyle.normal,
  //                     fontSize: 17),
  //               ),
  //             ),
  //           ),
  //         ),
  //         SizedBox(height: 25,),
  //         GestureDetector(
  //           onTap: () {
  //
  //           },
  //           child: Container(
  //             width: 110,
  //             child: CircleAvatar(
  //               backgroundColor: Colors.white,
  //               radius: 55,
  //               child: Container(
  //                 color: Colors.white,
  //                 margin: EdgeInsets.all(15),
  //                 child: Text(
  //                   'RECEIVE',
  //                   style: TextStyle(color: Colors.redAccent,
  //                       fontWeight: FontWeight.bold,
  //                       fontStyle: FontStyle.normal,
  //                       fontSize: 17),
  //                 ),
  //               ),
  //             ),
  //             decoration: new BoxDecoration(
  //               color: Colors.white,
  //               shape: BoxShape.circle,
  //               border: new Border.all(
  //                 color: Colors.redAccent,
  //                 width: 4.0,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   ),
  //   Text(
  //     'Index 1: Transaction Report',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: Profile',
  //     style: optionStyle,
  //   )
  // ];
  //
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

    @override
    Widget build(BuildContext context) {

      contextTest = context;
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      new Spacer(),
                      Container(
                        height: 400,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset("assets/images/nfcHomeBackground.jpeg"),
                      ),
                      SizedBox(height: 20,),
                      new Spacer(),
                      Column(
                        children: [
                          Text("SIMPLE-SECURE-INNOVATIVE",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                                fontSize: 18,
                                color: Colors.blueGrey),
                          ),
                          SizedBox(height:50),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(top: 20,bottom: 20,right: 50,left: 50),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              color: Colors.lightBlueAccent,
                              disabledColor: Colors.lightBlueAccent,
                              elevation: 5,
                              onPressed: () {
                                _modalBottomSheetMenuPay(contextTest);
                              },
                              child: Text("PAY",
                                style: TextStyle(fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height:25),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(top: 20,bottom: 50,right: 50,left: 50),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              color: Colors.lightBlueAccent,
                              disabledColor: Colors.lightBlueAccent,
                              elevation: 5,
                              onPressed: () {
                                doTransactionBalance("Balance Enquiry");
                              },
                              child: Text("CHECK BALANCE",
                                style: TextStyle(fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar:Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.lightBlueAccent)
          ),
          child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'About',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.support_agent),
              label: 'Help',
            ),
          ],
          unselectedItemColor: Colors.blueGrey,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.lightBlueAccent,
          onTap: _onItemTapped,
        ),
      ),
      );
    }
  }

  void showCustomDialog(BuildContext context) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            height: 600,
            width: 300,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  width: 75,
                  height: 75,
                  child: Image.asset('assets/images/nsc.png'),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          children: [
                            Text("Money Sent",
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 20,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),),
                            SizedBox(height: 25,),
                            Text('\$1000',
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 25,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),),
                            SizedBox(height: 5,),
                            Text('One Thousand Dollars',
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),),
                            SizedBox(height: 5,),
                            Text('24 Nov 2020',
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),)
                          ]
                      ),
                      new Spacer(),
                      Icon(Icons.assignment_turned_in,
                        color: Colors.green,
                        size: 75,)
                    ],
                  ),
                ),
                Container(
                  color: Colors.green,
                  height: 1,
                  margin: EdgeInsets.only(left: 15, right: 15),
                ),
                SizedBox(height: 20,),
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 15,),
                        Column(
                          children: [
                            Text('TO:',
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),),
                            Text('Ganesh L G',
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),),
                            Text('A/C No. XXXX XXXX 1234',
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),),
                          ],
                        ),
                        new Spacer(),
                        Icon(Icons.account_balance,
                          color: Colors.blueAccent,
                          size: 40,),
                        SizedBox(width: 15,),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        SizedBox(width: 15,),
                        Column(
                          children: [
                            Text('FROM:',
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),),
                            Text('Thor',
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),),
                            Text('XXXX XXXX XXXX 4321',
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),),
                          ],
                        ),
                        new Spacer(),
                        Container(
                          height: 80,
                          width: 80,
                          child: Image.asset('assets/images/nsc.png'),
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    Column(
                      children: [
                        Text('NFC Reference ID:',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),),
                        Text('XXXX XXXX 55',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),),
                      ],
                    ),
                    SizedBox(height: 25,),
                    RaisedButton(onPressed: () {
                      Navigator.pop(contextTest);
                    },
                      elevation: 5,
                      color: Colors.redAccent,
                      disabledColor: Colors.redAccent,
                      child: Text('OK',
                        style: TextStyle(color: Colors.white,
                          fontSize: 15,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),

          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }