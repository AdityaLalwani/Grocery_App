import 'package:flutter/material.dart';
import 'package:trolleygo_app/Home.dart';
import 'package:trolleygo_app/User.dart';
import 'package:trolleygo_app/customer-receipt.dart';
import 'package:trolleygo_app/stack.dart';
import 'package:trolleygo_app/register.dart';

import 'Home-page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class AppDrawer extends StatefulWidget {
  @override
    static String id='appdrawer';
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
 int _currState=1;
 final tabs=[
 UserPage(),CartPage(),HomePage(),CustomerReceipt()
 ];
  GlobalKey _bottomNavigationKey = GlobalKey();
 

  Widget build(BuildContext context) {
    return Scaffold(
      body:tabs[_currState],
      bottomNavigationBar: CurvedNavigationBar(
        height: 55,
        animationDuration: Duration(milliseconds: 200),
        color:Colors.deepPurple[900],
        backgroundColor: Colors.transparent,
        animationCurve: Curves.bounceInOut,
        buttonBackgroundColor: Colors.lightBlueAccent,
         key:_bottomNavigationKey,
         index: 1,
        items: [
           
            Icon(Icons.people,color: Colors.white,),
           Icon(Icons.shopping_cart,color: Colors.white,),
            Icon(Icons.star,color: Colors.white,),
           Icon(Icons.list,color: Colors.white,), 
           
        ],
        onTap: (index){
          setState(() {
            _currState=index;
       
          });
        
        },
      ),
    );
  }
}