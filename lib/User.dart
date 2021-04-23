import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:trolleygo_app/loginpage.dart';

class UserPage extends StatefulWidget {
  @override
  static String id='userpage';
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
    final FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:
          SafeArea(
                      child: Column(children: <Widget>[
                        Container(
                            height: 350,
                            width: double.infinity,
                           
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft:Radius.circular(45),
                              bottomRight:Radius.circular(45)
                              ),
                              gradient: LinearGradient(
                                begin:Alignment.topLeft,
                                end:Alignment.bottomRight,
                                colors: [Colors.deepPurple[900], Colors.blueAccent],
                              ),
                            ),
                            child: Center(
                                child: Container(
                                  margin: EdgeInsets.only(top:15,left:20,right:20),
                                  child: Column(
                                  children: <Widget>[
                                   Padding(
                                     padding:EdgeInsets.only(top:30),
                                      child: CircleAvatar(
                                       radius: 70,
                                       backgroundImage:AssetImage('assets/images/ridz.jpg'),
                                       ),
                                   ),
                                   SizedBox(height: 20,),
                                   Center(child: Text('Ridham Kachhadiya',
                                   style:TextStyle(
                                     color: Colors.lightBlueAccent,
                                     fontFamily: 'MontserratB',
                                     fontSize: 27,
                                     ),
                                   ),
                                   ),
                                    SizedBox(height: 10,),
                                   Center(child: Text('Pro. Shopper',
                                   style:TextStyle(
                                     color: Colors.lightBlue[100],
                                     fontFamily: 'MontserratB',
                                     fontSize: 22,
                                     ),
                                   ),
                                   ),
                                   
                                   
                                   SizedBox(height: 10,),
                                   Center(child: Text('TrolleyGo',
                                   style:TextStyle(
                                     color: Colors.lightBlue[100],
                                     fontFamily: 'Lobster',
                                     fontWeight: FontWeight.bold,
                                     letterSpacing:0.5 ,
                                     fontSize: 25,
                                     ),
                                   ),
                                   ),
                                ],
                                ),
                              ),
                            ),
         ),
         Container(
           height: 300,
           margin: EdgeInsets.only(left:35,top:40),
           child:Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
               Container(
                   child: Row(children: <Widget>[
                     Icon(Icons.local_grocery_store,
                     color: Colors.lightBlue,
                     size: 27,
                     ),
                     SizedBox(width: 20,),
                   Text('GrofersCo.',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Montserrat',
                color: Colors.black,
                ),
              ),
                 ],
                 ),
               ),
              Container(
                   child: Row(children: <Widget>[
                     Icon(Icons.person,
                     color: Colors.lightBlueAccent,
                     size: 27,
                     ),
                     SizedBox(width: 20,),
                   Text('#00127',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Montserrat',
                color: Colors.black,
                ),
              ),
                 ],
                 ),
               ),
               Container(
                   child: Row(children: <Widget>[
                     Icon(Icons.fastfood,
                     color: Colors.lightBlueAccent,
                     size: 27,
                     ),
                      SizedBox(width: 20,),
                   Text('Orders',
              style: TextStyle(
                fontSize:18,
                fontFamily: 'Montserrat',
                color: Colors.black,
                ),
              ),
                 ],
                 ),
               ),
               
               Container(
                   child: Row(children: <Widget>[
                     Icon(Icons.help,
                     color: Colors.lightBlueAccent,
                     size: 27,
                     ),
                     SizedBox(width: 20,),
                   Text('Help & Support',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Montserrat',
                color: Colors.black,
                ),
              ),
                 ],
                 ),
               ),
              
               Container(
                   child: Row(children: <Widget>[
                     Icon(Icons.location_on,
                     color: Colors.lightBlueAccent,
                     size: 27,
                     ),
                     SizedBox(width: 20,),
                   Text('Location',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Montserrat',
                color: Colors.black,
                ),
              ),
                 ],
                 ),
               ),
            

           ],
           ),
         ),
         SizedBox(height: 25,),
            GestureDetector(
                    onTap: (){
                      _auth.signOut();
                      Navigator.pushNamed(context, LoginPage.id);

                    },
                      child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ),
                        height: 45,
                        width: 250,
                        margin: EdgeInsets.symmetric(horizontal: 60),
                        
                        child: Center(
                          child: Text(
                            "LOGOUT",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontFamily: 'MontserratB',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
         
                      ],
                   
                           
                      ),
                  
          ),
       
    );
  }
}