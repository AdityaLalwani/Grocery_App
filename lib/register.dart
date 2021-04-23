import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemRegister extends StatefulWidget {
  @override
  static String id='register-id';
  _ItemRegisterState createState() => _ItemRegisterState();
}

class _ItemRegisterState extends State<ItemRegister> {
  @override
  String name;
  String brand;
  String idn;
  String rtype;
  String rate;
  String img;
  final ncontroller=TextEditingController();
  final bcontroller=TextEditingController();
  final icontroller=TextEditingController();
  final rcontroller=TextEditingController();
  final rtcontroller=TextEditingController();
   final imgcontroller=TextEditingController();

  final _fire=Firestore.instance;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: false,
        title: Text('Register Item',style: TextStyle(fontFamily: 'Lobster'),),
        backgroundColor: Colors.deepPurple[900],
        
      ),
      backgroundColor: Colors.white,
      
      body:Column(children: <Widget>[
        SizedBox(
                          height: 30.0,
                        ),
       Container(
                          height: 50.0,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                          ),
                          child: TextField(
                             onChanged: (value) {
                        name=value;//Do something with the user input.
                      },
                           controller: ncontroller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Name",
                              hintStyle: TextStyle(color: Colors.grey),
                              prefixIcon:
                                  Icon(Icons.lock, color: Colors.purple),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          height: 50.0,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                          ),
                          child: TextField(
                             onChanged: (value) {
                        brand=value;//Do something with the user input.
                      },
                           controller: bcontroller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Brand",
                              hintStyle: TextStyle(color: Colors.grey),
                              prefixIcon:
                                  Icon(Icons.lock, color: Colors.purple),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          height: 50.0,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                          ),
                          child: TextField(
                             onChanged: (value) {
                        idn=value;//Do something with the user input.
                      },
                            controller: icontroller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "ID",
                              hintStyle: TextStyle(color: Colors.grey),
                              prefixIcon:
                                  Icon(Icons.lock, color: Colors.purple),
                            ),
                          ),
                        ),
                        
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          height: 50.0,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                          ),
                          child: TextField(
                             onChanged: (value) {
                        rate=value;//Do something with the user input.
                      },
                            controller: rcontroller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Price",
                              hintStyle: TextStyle(color: Colors.grey),
                              prefixIcon:
                                  Icon(Icons.lock, color: Colors.purple),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          height: 50.0,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                          ),
                          child: TextField(
                             onChanged: (value) {
                        rtype=value;//Do something with the user input.
                      },
                            controller: rtcontroller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Price type",
                              hintStyle: TextStyle(color: Colors.grey),
                              prefixIcon:
                                  Icon(Icons.lock, color: Colors.purple),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          height: 50.0,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                          ),
                          child: TextField(
                             onChanged: (value) {
                        img=value;//Do something with the user input.
                      },
                            controller: imgcontroller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Price type",
                              hintStyle: TextStyle(color: Colors.grey),
                              prefixIcon:
                                  Icon(Icons.lock, color: Colors.purple),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Center(
                      child: RaisedButton(
                  onPressed: () {
                      ncontroller.clear();
                       icontroller.clear();
                        bcontroller.clear();
                         rcontroller.clear();
                          rtcontroller.clear();
                      _fire.collection('products').add({
                        'p_img':img,
                        'pro_brand':brand,
                        'pro_id':'#$idn',
                        'pro_name':name,
                        'pro_rate':'₹$rate',
                        'pro_rtype':rtype,
                      });},
                  child:Text('ADD'),
                  ),
                ),

      ],

      ),
      
    );
  }
}