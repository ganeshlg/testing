// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:local_auth/local_auth.dart';
// import 'package:flutter/services.dart';
// import 'package:get_it/get_it.dart';
//
// GetIt locator = GetIt();
//
// void setupLocator() {
//   locator.registerLazySingleton(() => LocalAuthenticationService());
// }
//
//
// class LocalAuthenticationService {
//   final _auth = LocalAuthentication();
//   bool _isProtectionEnabled = false;
//
//   bool get isProtectionEnabled => _isProtectionEnabled;
//
//   set isProtectionEnabled(bool enabled) => _isProtectionEnabled = enabled;
//
//   bool isAuthenticated = false;
//
//   Future<void> authenticate() async {
//     if (_isProtectionEnabled) {
//       try {
//         isAuthenticated = await _auth.authenticateWithBiometrics(
//           localizedReason: 'authenticate to access',
//           useErrorDialogs: true,
//           stickyAuth: true,
//         );
//       } on PlatformException catch (e) {
//         print(e);
//       }
//     }
//   }
// }
//
// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final LocalAuthenticationService _localAuth = locator<
//       LocalAuthenticationService>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//             Align(
//               alignment: Alignment.topRight,
//               child:
//               Container(
//                 margin: EdgeInsets.all(20),
//                 child: RaisedButton(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(18.0),
//                   ),
//                   color: Colors.white,
//                   disabledColor: Colors.white,
//                   elevation: 5,
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => LoginScreen(),
//                         )
//                     );
//                   },
//                   child: Text("skip",
//                     style: TextStyle(fontWeight: FontWeight.normal,
//                         fontStyle: FontStyle.normal,
//                         fontSize: 15,
//                         color: Colors.blueGrey),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Column(
//                   children: [
//                     new Spacer(),
//                     Container(
//                       height: 300,
//                       width: 200,
//                       child: Image.asset("assets/images/nfcPay.jpeg"),
//                     ),
//                     SizedBox(height: 20,),
//                     Text("Tap on PhonePayments",
//                       style: TextStyle(fontWeight: FontWeight.bold,
//                           fontStyle: FontStyle.normal,
//                           fontSize: 20,
//                           color: Colors.black),
//                     ),
//                     SizedBox(height: 20,),
//                     Container(
//                       margin: EdgeInsets.only(left: 10,right: 10),
//                       child: Text("\"Tap on Phone\" SoftPOS provides merchants the flexibility of mobile contact less payment acceptance.",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(fontWeight: FontWeight.normal,
//                             fontStyle: FontStyle.normal,
//                             fontSize: 18,
//                             color: Colors.blueGrey),
//                       ),
//                     ),
//                     SizedBox(height: 20,),
//                     new Spacer(),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: GestureDetector(
//         onTap: () {
//           _localAuth.authenticate();
//         },
//         child: Container(
//           alignment: Alignment.center,
//           color: Colors.lightBlueAccent,
//           height: 75,
//           width: MediaQuery.of(context).size.width,
//           child: Text("GOT IT",
//             style: TextStyle(fontWeight: FontWeight.bold,
//                 fontStyle: FontStyle.normal,
//                 fontSize: 15,
//                 color: Colors.white),),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Dash_Board.dart';


class LoginScreen extends StatefulWidget{
  @override
  _LogScreenState createState() => _LogScreenState();
}

class _LogScreenState extends State<LoginScreen> {
  bool _showPassword = false;
  final _text = TextEditingController();
  bool _validate = false;
  bool _validateLen = false;

  String errorMessage(){
    if(_validate){
      return "Pin can\'t be empty";
    }else if(_validateLen){
      return "Invalid pin...!!!";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    void _onLoading() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              margin: EdgeInsets.all(25),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  new CircularProgressIndicator(),
                  SizedBox(width: 10,),
                  new Text("Loading..."),
                ],
              ),
            ),
          );
        },
      );
      new Future.delayed(new Duration(seconds: 3), () {
        Navigator.pop(context); //pop dialog
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DashBoard(),
            )
        );
      });
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 300,
                color: Colors.lightBlueAccent,
              ),
            ],
          ),
          Positioned(
            top: 230,
            left: 50,
            right: 50,
            child: Card(
              elevation: 10,
              child: Column(
                children: [
                  SizedBox(height: 70,),
                  Container(
                    alignment: Alignment.center,
                    child: Text('Enter Your PIN',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 18),),
                  ),
                  SizedBox(height: 30,),
                  Theme(
                    data: ThemeData(
                      primaryColor: Colors.black,
                      primaryColorDark: Colors.black,
                    ),
                    child: Container(
                  margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                    child: TextField(
                      onTap: (){
                        setState(() {
                          _validate = false;
                          _validateLen = false;
                        });
                      },
                      controller: _text,
                      keyboardType: TextInputType.number,
                      maxLength: 4,
                      obscureText: !this._showPassword,
                      decoration: InputDecoration(
                        errorText:(_validate||_validateLen) ? errorMessage() : null,
                        labelStyle: TextStyle(
                            color: Colors.black
                        ),
                        hintStyle: TextStyle(
                            color: Colors.black
                        ),
                        labelText: 'PIN',
                        prefixIcon: Icon(Icons.security,
                        color: Colors.lightBlue,),
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: this._showPassword ? Colors.grey : Colors.lightBlue,
                          ),
                          onPressed: () {
                            setState(() => this._showPassword = !this._showPassword);
                          },
                        ),
                      ),
                    ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(right:20),
                    child: Text('Forgot PIN/Login Issues?',
                      style: TextStyle(color: Colors.lightBlueAccent,
                        fontSize: 12,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  RaisedButton(
                    onPressed: () {
                      setState(() {

                        _text.text.isEmpty ? _validate = true : _validate = false;

                        (_text.text.length>0&&_text.text.length<4)? _validateLen=true: _validateLen= false;

                        if(!_validate && !_validateLen){
                          _onLoading();
                        }

                      });
                    },
                    elevation: 5,
                    color: Colors.lightBlue,
                    disabledColor: Colors.lightBlue,
                    child: Text('SUBMIT',
                      style: TextStyle(color: Colors.white,
                        fontSize: 15,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Powered By",
                        style: TextStyle(fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal),
                      ),
                      SizedBox(width: 20,),
                      Container(
                          width: 50,
                          height: 50,
                          child: Image.asset("assets/images/companylogo.png")
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
//
//
//
//     // return Material(
//     //   color: Colors.white,
//     //   child: SafeArea(
//     //     child: Column(
//     //       children: [
//     //         Container(
//     //           margin: EdgeInsets.all(10),
//     //           width: 300,
//     //           height: 150,
//     //           child: Image.asset('assets/images/nsc.png'),
//     //         ),
//     //         Align(
//     //           alignment: Alignment.center,
//     //           child: Card(
//     //             margin: EdgeInsets.all(20),
//     //             elevation: 10,
//     //             child: Column(
//     //               children: [
//     //                 SizedBox(height: 10,),
//     //                 Text('Welcome to NSC Payment!',
//     //                   style: TextStyle(color: Colors.black,
//     //                       fontWeight: FontWeight.bold,
//     //                       fontStyle: FontStyle.normal,
//     //                       fontSize: 20),),
//     //                 SizedBox(height: 30,),
//     //                 Container(
//     //                   margin: EdgeInsets.only(left: 20),
//     //                   alignment: Alignment.centerLeft,
//     //                   child: Text('Login to continue',
//     //                     textAlign: TextAlign.start,
//     //                     style: TextStyle(color: Colors.redAccent,
//     //                         fontWeight: FontWeight.bold,
//     //                         fontStyle: FontStyle.normal,
//     //                         fontSize: 15),),
//     //                 ),
//     //                 SizedBox(height: 15,),
//     //                 Theme(
//     //                   data: ThemeData(
//     //                     primaryColor: Colors.black,
//     //                     primaryColorDark: Colors.black,
//     //                   ),
//     //                   child: Container(
//     //                     margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
//     //                     child: TextField(
//     //                       keyboardType: TextInputType.number,
//     //                       maxLength: 10,
//     //                       cursorColor: Colors.black,
//     //                       decoration: InputDecoration(
//     //                         labelStyle: TextStyle(
//     //                             color: Colors.black
//     //                         ),
//     //                         hintStyle: TextStyle(
//     //                             color: Colors.black
//     //                         ),
//     //                         suffixIcon: Icon(Icons.phone,
//     //                           color: Colors.redAccent,),
//     //                         prefixText: '+91',
//     //                         border: OutlineInputBorder(),
//     //                         labelText: 'Enter 10 digit mobile number',
//     //                       ),
//     //                     ),
//     //                   ),
//     //                 ),
//     //                 SizedBox(height: 10,),
//     //             Theme(
//     //               data: ThemeData(
//     //                 primaryColor: Colors.black,
//     //                 primaryColorDark: Colors.black,
//     //               ),
//     //             child: Container(
//     //               margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
//     //                 child: TextField(
//     //                   keyboardType: TextInputType.number,
//     //                   maxLength: 6,
//     //                   obscureText: !this._showPassword,
//     //                   decoration: InputDecoration(
//     //                     labelStyle: TextStyle(
//     //                         color: Colors.black
//     //                     ),
//     //                     hintStyle: TextStyle(
//     //                         color: Colors.black
//     //                     ),
//     //                     labelText: 'Password',
//     //                     prefixIcon: Icon(Icons.security,
//     //                     color: Colors.redAccent,),
//     //                     border: OutlineInputBorder(),
//     //                     suffixIcon: IconButton(
//     //                       icon: Icon(
//     //                         Icons.remove_red_eye,
//     //                         color: this._showPassword ? Colors.grey : Colors.redAccent,
//     //                       ),
//     //                       onPressed: () {
//     //                         setState(() => this._showPassword = !this._showPassword);
//     //                       },
//     //                     ),
//     //                   ),
//     //                 ),
//     //               ),
//     //             ),
//     //                 RaisedButton(onPressed: () {
//     //                   _onLoading();
//     //                 },
//     //                   elevation: 5,
//     //                   color: Colors.redAccent,
//     //                   disabledColor: Colors.redAccent,
//     //                   child: Text('Login Securely',
//     //                     style: TextStyle(color: Colors.white,
//     //                       fontSize: 15,
//     //                       fontStyle: FontStyle.normal,
//     //                       fontWeight: FontWeight.bold,
//     //                     ),
//     //                   ),
//     //                 ),
//     //                 Row(
//     //                   mainAxisAlignment: MainAxisAlignment.center,
//     //                   children: [
//     //                     Text("Powered By",
//     //                       style: TextStyle(fontSize: 15,
//     //                           fontWeight: FontWeight.bold,
//     //                           fontStyle: FontStyle.normal),
//     //                     ),
//     //                     SizedBox(width: 20,),
//     //                     Container(
//     //                         width: 50,
//     //                         height: 50,
//     //                         child: Image.asset("assets/images/companylogo.png")
//     //                     )
//     //                   ],
//     //                 ),
//     //               ],
//     //             ),
//     //           ),
//     //         ),
//     //         GestureDetector(
//     //           child: Container(
//     //             margin: EdgeInsets.all(15),
//     //             decoration: BoxDecoration(
//     //               borderRadius: BorderRadius.circular(10),
//     //               border: Border.all(
//     //                 color: Colors.black,
//     //                 width: 1,
//     //               ),
//     //             ),
//     //             child: Container(
//     //               alignment: Alignment.center,
//     //               margin: EdgeInsets.all(10),
//     //               child: Text(
//     //                 'Facing issue? Click here',
//     //                 style: TextStyle(fontSize: 15,
//     //                 fontWeight: FontWeight.bold,
//     //                 fontStyle: FontStyle.normal,
//     //                 color: Colors.redAccent),
//     //               ),
//     //             ),
//     //           ),
//     //         ),
//     //       Expanded(
//     //         child: Align(
//     //         alignment: FractionalOffset.bottomCenter,
//     //         child: Row(
//     //           mainAxisAlignment: MainAxisAlignment.center,
//     //           children: [
//     //             Text('Not Registered yet?',
//     //               style: TextStyle(fontSize: 15,
//     //                   fontStyle: FontStyle.normal,
//     //                   fontWeight: FontWeight.normal,
//     //                   color: Colors.black),
//     //             ),
//     //             SizedBox(width: 20,),
//     //             RaisedButton(onPressed: null,
//     //               elevation: 5,
//     //               color: Colors.redAccent,
//     //               disabledColor: Colors.redAccent,
//     //               child: Text('Register',
//     //                 style: TextStyle(
//     //                     fontWeight: FontWeight.bold,
//     //                     fontStyle: FontStyle.italic,
//     //                     color: Colors.white,
//     //                     fontSize: 15
//     //                 ),
//     //               ),
//     //             ),
//     //           ],
//     //         ),
//     //       ),
//     //       ),
//     //       ],
//     //     ),
//     //   ),
//     // );
//   }
//
// }