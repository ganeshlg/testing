import 'package:nfcpay_integra/Login_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntScreen extends StatefulWidget {
  @override
  _IntScreenState createState() => _IntScreenState();
}

class _IntScreenState extends State<IntScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: 
            Container(
              margin: EdgeInsets.all(20),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
              ),
              color: Colors.white,
              disabledColor: Colors.white,
              elevation: 5,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    )
                );
              },
              child: Text("skip",
                style: TextStyle(fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                    fontSize: 15,
                    color: Colors.blueGrey),
              ),
            ),
          ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  new Spacer(),
                    Container(
                      height: 400,
                      width: 400,
                      child: Image.asset("assets/images/nfcPay.png"),
                    ),
                  SizedBox(height: 20,),
                  Text("Tap on phone payments",
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.only(left: 10,right: 10),
                    child: Text("\"Tap on Phone\" SoftPOS provides merchants the flexibility of mobile contact less payment acceptance.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          fontSize: 18,
                          color: Colors.blueGrey),
                    ),
                  ),
                  SizedBox(height: 20,),
                  new Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              )
          );
        },
        child: Container(
          alignment: Alignment.center,
          color: Colors.lightBlueAccent,
          height: 75,
          width: MediaQuery.of(context).size.width,
          child: Text("GOT IT",
            style: TextStyle(fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                fontSize: 15,
                color: Colors.white),),
        ),
      ),
    );
  }
}