import 'package:flutter/material.dart';
import './Animation/FadeAnimation.dart';
import 'Animation/FadeAnimation.dart';
import 'AppDrawer.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterUser extends StatefulWidget {
  @override
  static String id='register_user';
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  @override
  String _pass,_email;
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
   
      backgroundColor: Colors.white,
      body: 
             Center(
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                   
                   FadeAnimation(1,
                               Center(
                         child: Container(height: 200,
                         margin: EdgeInsets.only(top:30),
                         width:230,
                         child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/TrolleyGoLogo.png'),
                  ),
                         ),
                     ),
                   ),
                   
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                           
                            SizedBox(
                              height: 35.0,
                            ),
                           
                             
                            
                          
                            FadeAnimation(
                              1,
                              Form(
                                key: _formkey,
                                 child: Container(
        width: double.infinity,
        
        decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, 15.0),
                            blurRadius: 15.0),
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, -10.0),
                            blurRadius: 10.0),
                    ]),
        child: Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                       
                               
                                Text(
                                  'REGISTER',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    fontFamily: 'MontserratB',
                                    color: Colors.black,
                                  ),
                                ),
                              
                          SizedBox(
                              height: 20.0,
                            ),
                        
                        Text("Email",
                            style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.bold,
                                  fontSize:18),),
                        TextFormField(
                          style: TextStyle(fontFamily: 'Montserrat',color: Colors.blueAccent,fontWeight: FontWeight.bold),
                          onChanged: (val){
                           setState(() =>_email=val);
                             
                           
                          },
                          validator: (val)=>val.isEmpty?'Enter an Email':null,
                          decoration: InputDecoration(
                                hintText: "Enter a valid email id",
                                hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0,fontFamily: "Montserrat",
                                  fontWeight: FontWeight.bold,)),

                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Password",
                            style: TextStyle(
                                 fontFamily: "Montserrat",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),),
                        TextFormField(
                          obscureText: true,
                          style: TextStyle(fontFamily: 'Montserrat',color: Colors.blueAccent,fontSize: 20),
                          validator:  (val)=>val.length<8?'Password must be atleast 8 characters long':null,
                          onChanged: (val){
                           setState(() =>_pass=val);
                          },
                          decoration: InputDecoration(
                               
                                hintText: "Enter your desired password",
                                hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0,fontFamily: "Montserrat",
                                  fontWeight: FontWeight.bold,)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        
                        SizedBox(
                          height: 40,
                        ),
                    ],
                  ),
        ),
    ),
                              ),),
                            SizedBox(
                              height: 35.0,
                            ),
                            FadeAnimation(
                              1,
                              GestureDetector(
                                onTap:()async{
                                 try{
                 final newuser=await _auth.createUserWithEmailAndPassword(email: _email, password: _pass);
                 if(newuser!=null){
                   Navigator.pushNamed(context, AppDrawer.id);
                   setState(() {
                    
                  });
                 }
                  }catch(e){
                    print(e);
                  }


                                },
                                 
                             
                             
                                  child: InkWell(
                                  child: Container(
                                    height: 50,
                                    
                                    margin: EdgeInsets.symmetric(horizontal: 90),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      gradient: LinearGradient(
                                        colors: [Colors.lightBlueAccent, Colors.blueAccent],
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "REGISTER",
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
                            ),
                            
                           
                            SizedBox(
                              height: 50.0,
                            ),
                           
                          ],
                        ),
                        
                    )
                  ],
        ),
                
              ),
            ),
          
              
      
    );
  }
}