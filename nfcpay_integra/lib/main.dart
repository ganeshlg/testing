import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nfcpay_integra/Initial_Screen.dart';

main(){
  runApp(MaterialApp(
    home: MyApp(),
  ));
  }

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  AnimationController animation;
  Animation<double> _fadeInFadeOut;

  @override
  void initState() {
    super.initState();

    Future.delayed(
        Duration(
            seconds: 5
        ),
            (){
          animation.dispose();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => IntScreen(),
              )
          );
        }
    );

    animation = AnimationController(vsync: this, duration: Duration(seconds: 1),);
    _fadeInFadeOut = Tween<double>(begin: 0.25, end: 0.75).animate(animation);

    animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        animation.reverse();
      }
      else if(status == AnimationStatus.dismissed){
        animation.forward();
      }
    });
    animation.forward();
  }

  @override
  Widget build(BuildContext context) {
    return
      AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
          statusBarColor: Colors.lightBlueAccent,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            new Spacer(),
            Center(
              child: FadeTransition(
                opacity: _fadeInFadeOut,
                child: Container(
                  height: 400,
                  width: 400,
                  child: Image.asset("assets/images/nfcPay.png"),
                ),
              ),
            ),
            Expanded(
                  child: Align(
                    alignment: Alignment.center,
                  child: Column(
                    children: [
                      new Spacer(),
                  SizedBox(height: 20,),
                  Text("Tap on phone payments",
                      style: TextStyle(fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      color: Colors.black),
                      ),
                      SizedBox(height: 20,),
                    ],
              ),
                  ),
            )
          ],
        ),
        bottomNavigationBar: Container(
          alignment: Alignment.center,
          color: Colors.lightBlueAccent,
          height: 75,
          width: MediaQuery.of(context).size.width,
          child: Text("Powered by Integra Micro Systems",
          style: TextStyle(fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          fontSize: 15,
          color: Colors.white),),
        ),
      )
      );
  }
}