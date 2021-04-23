import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trolleygo_app/AppDrawer.dart';
import 'package:trolleygo_app/Registeruser.dart';
import 'package:trolleygo_app/register.dart';
import './Animation/FadeAnimation.dart';
import 'Animation/FadeAnimation.dart';
import 'Home-page.dart';
import 'Home.dart';




class LoginPage extends StatefulWidget {
  @override
  static String id='login-page';
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                                  'LOGIN',
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
                        
                        Text("Username",
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
                                hintText: "Enter your email id",
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
                               
                                hintText: "Enter your password",
                                hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0,fontFamily: "Montserrat",
                                  fontWeight: FontWeight.bold,)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    color: Colors.lightBlueAccent,
                                    fontFamily: "Montserrat",
                                  fontWeight: FontWeight.bold,
                                    fontSize: 18),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                    ],
                  ),
        ),
    ),
                              ),),
                            SizedBox(
                              height: 20.0,
                            ),
                            FadeAnimation(
                              1,
                              GestureDetector(
                                onTap: ()async{
                                  try{
                                    if(_formkey.currentState.validate()){
                                  var result=await signin();
                                  if(result!=null){
                               Navigator.pushNamed(context, AppDrawer.id);
                                print('LOGGED IN SUCCESFULLY');
                              }
                                  }
                                  
                             }
                               catch(e){
                              print(e.message);
                              print("LOGIN FAILED");
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
                                        "LOGIN",
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
                              height: 30.0,
                            ),
                            FadeAnimation(
                              1,
                              Center(
                                child: GestureDetector(
                                  onTap: (){
                               Navigator.pushNamed(context, RegisterUser.id);
                                print('LOGGED IN SUCCESFULLY');
                                },
                                    child: Text(
                                    "Don't Have an Account?Sign up here",
                                    style: TextStyle(
                                      color: Colors.lightBlueAccent,
                                      fontSize: 17.0,
                                      letterSpacing: -0.5,
                                      fontFamily: 'Montserrat'

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
  Future signin() async{
   
      var result= await _auth.signInWithEmailAndPassword(email: _email, password: _pass);
      return result;
      
    
  }
}
