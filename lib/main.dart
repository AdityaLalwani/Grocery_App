
import 'package:flutter/material.dart';
import 'package:trolleygo_app/AppDrawer.dart';
import 'package:trolleygo_app/Home.dart';
import 'package:trolleygo_app/Registeruser.dart';
import 'package:trolleygo_app/SplashScreen.dart';
import 'package:trolleygo_app/customer-receipt.dart';
import 'package:trolleygo_app/register.dart';
import 'Home-Page.dart';
import 'User.dart';
import './Animation/FadeAnimation.dart';
import 'Animation/FadeAnimation.dart';
import 'loginpage.dart';
import 'AppDrawer.dart';
void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.id,
        routes: {
          LoginPage.id:(context)=>LoginPage(),
          CartPage.id:(context)=>CartPage(),
          ItemRegister.id:(context)=>ItemRegister(),
          HomePage.id:(context)=>HomePage(),
          UserPage.id:(context)=>UserPage(),
          AppDrawer.id:(context)=>AppDrawer(),
          CustomerReceipt.id:(context)=>CustomerReceipt(),
          SplashScreen.id:(context)=>SplashScreen(),
          RegisterUser.id:(context)=>RegisterUser(),
        },
      ),
    );

