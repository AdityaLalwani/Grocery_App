import 'package:flutter/material.dart';
import 'dart:async';

import 'package:trolleygo_app/loginpage.dart';

class SplashScreen extends StatefulWidget {
  @override
  static String id='SplashScreen';
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),
    (){
      Navigator.pushNamed(context, LoginPage.id);
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height: double.infinity,
        width: double.infinity,
        child: Image(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/shops.jpg'),
          ),
        ),
        );

  }
}