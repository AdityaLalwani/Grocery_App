import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stackcard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: 
                 
                     
                    
                         Container(
                                                    child: Stack(
                        overflow: Overflow.visible,
                        alignment: Alignment.bottomCenter,
                        children:<Widget>[
                            Container(),
           SizedBox(height: 170,
           width:200,
           child:Card(
             elevation: 4,
             child: Container(
               padding: EdgeInsets.only(top:75,left: 13,right: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                       Text('Eggs',
                      style:TextStyle(
                           fontSize: 18,
                           fontFamily: 'OpenSans',
                           fontWeight: FontWeight.bold,
                           color: Colors.black,
                      ) ,
                      ),
                       Text('#12345',
                      style:TextStyle(
                           fontSize: 10,
                           fontFamily: 'OpenSans',
                           
                           color: Colors.blueAccent[100],
                      ) ,
                      ),
                      ],
                      ),
                            SizedBox(height: 5,),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                      Text('NurtureCo.',
                      style:TextStyle(
                           fontSize: 12,
                           fontFamily: 'OpenSans',
                           fontWeight: FontWeight.bold,
                           color: Colors.blueAccent[100],
                      ) ,
                      ),
                       Text('*/KG',
                      style:TextStyle(
                           fontSize: 10,
                           fontFamily: 'OpenSans',
                       
                           color: Colors.blueAccent[100],
                      ) ,
                      ),
                      ],
                      ),
                   SizedBox(height: 5,),
                      
                  
                Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                       Text('₹50',
                      style:TextStyle(
                           fontSize: 19,
                           fontFamily: 'OpenSans',
                           fontWeight: FontWeight.bold,
                           color: Colors.black,
                      ) ,
                      ),
                       InkWell(
                        child: Container(
                            height: 25,
                            width:70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(
                                colors: [Colors.lightBlueAccent, Colors.blueAccent],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Add to cart",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'OpenSans',
                                    fontSize: 11.0,
                                     fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                        ),
                      ),
                      ],
                      ),


            ],
            
            ),

             )
             
             ),
           
           ),
            Positioned(
            
            top: -75,
            child: SizedBox(height: 150,
           width:180,
           child:Card(
             child: Container(
             child: Image(
               fit: BoxFit.cover,
               image:AssetImage('assets/images/milk.jpg'),
               ) ,
           ),
           ),
              ),
            ),

           ]

           ),
                         ),
                    
         
                 
       
    );
    
  }
}