
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:trolleygo_app/customer-receipt.dart';
import 'CartConst.dart';
double cart_tot=0.0;

class HomePage extends StatefulWidget {
  @override
  static String id='homepage';
 
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  cartcon c1=new cartcon();
  int counter=1;
  bool cn=false;
  List<String> b_list=['test','test','test','test','test'];
  

  String barcode='';
  
  

  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar( automaticallyImplyLeading: false,backgroundColor:Colors.deepPurple[900] ,
    title: Text('Shopping Cart',style: TextStyle(color: Colors.white,fontFamily: 'Raleway',letterSpacing: -0.4,fontWeight: FontWeight.bold),
    ),
    actions: <Widget>[
    Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: GestureDetector(
        onTap: () {
          setState(()async {
                          await scan();
                          if(b_list[0]!='*'){
                          var item= cartcon(cc_name: b_list[0],cc_brand: b_list[1],cc_id: b_list[2],cc_rate: double.parse(b_list[3]),cc_type: b_list[4],cc_img: b_list[5],cc_quan: counter); 
                          products.add(item);
                          print(products.length);
                          print(double.parse(b_list[3]));
                          cart_tot= cart_tot+ double.parse(b_list[3]);
                          
                          }
                          
                        });
        },
        child: CircleAvatar(
          radius: 20,
                  backgroundColor: Colors.blue[100],
                  child: Icon(
            Icons.add,
            size: 30.0,
            color: Colors.deepPurple[900],
          ),
        ),
      )
    ),
    ],
    ),
   
    body:
      
    
       
         Column(children: <Widget>[
  Expanded(
      child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (items,int index) =>Dismissible(
              
                
                onDismissed: (direction){
                  setState(() {
                     cart_tot=cart_tot-(products[index].cc_rate*products[index].cc_quan);
                    products.removeAt(index);
                   
                  });
                },
                child: CartItem(ci_name: products[index].cc_name,
                ci_brand: products[index].cc_brand,
                ci_id: products[index].cc_id,
                ci_rate: products[index].cc_rate,
                ci_type: products[index].cc_type,
                ci_img: products[index].cc_img,
                ci_quan:products[index].cc_quan,
                inc:(){
                  setState(() {
                    products[index].cc_quan++;
                    cart_tot=cart_tot+(products[index].cc_rate);
                  });
    
                },
                dec:(){
                  setState(() {
                    if(products[index].cc_quan!=0){
                    products[index].cc_quan--;
                    cart_tot=cart_tot-(products[index].cc_rate);
                  }
                  });
    
                }  
                ),
                key: UniqueKey()
              ),
               
                 
              
              ),
  ),
  
            InkWell(
                
                 child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.lightBlue[50]),
                height: 100,
              
                child: Container(
                  margin: EdgeInsets.only(left:15,right: 15),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    
                    children: <Widget>[
                       SizedBox(height: 25,), 
                      Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[ 
                        
                      Text('Sub Total:',
                      style: TextStyle(
                       color:Colors.black54,
                      fontSize: 25, 
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                      ),
                      ),
                      SizedBox(width: 10,), 
                      Container(
                        width:100,
                         child: Text('₹$cart_tot',
                        style: TextStyle(
                         color:Colors.deepPurple[900],
                        fontSize: 25, 
                        fontFamily: 'OpenSansB',
                        fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                       SizedBox(width: 53,), 
                       GestureDetector(
                    onTap: (){
                      if(products.isNotEmpty){
                        Navigator.pushNamed(context, CustomerReceipt.id);
                        
                        
                      }
                    },
                      child: InkWell(
                      child: Container(
                        margin: EdgeInsets.only(top:5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepPurple[900],
                        ),
                        height: 45,
                        width: 80,
                        
                        
                        child: Center(
                          child: Text(
                            "ORDER",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontFamily: 'MontserratB',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                    ],
                    ),
                     SizedBox(height: 3,),
                    Text('*Delivery & Tax Charges are not inclusive*',
                      style: TextStyle(
                       color:Colors.black54,
                      fontSize: 12, 
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                      ),
                      ),
                  ],
                      
                  ),
                ),
                ),
            ),
              SizedBox(height: 7,),

         ],
                   
         ),
          
        
                  
        
      
    

                
             
          
    );
  }


Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState((){ 
        this.barcode = barcode;
        List<String> b_list=barcode.split('^');     
        this.b_list=b_list;
        });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.b_list =['*'];
        });
      } else {
        setState(() =>  this.b_list =['*']);
      }
    } on FormatException{
      setState(() =>  this.b_list =['*']);
    } catch (e) {
      setState(() =>  this.b_list =['*']);
    }
  }
}

  class CartItem extends StatelessWidget {
    @override
    String ci_name;
    String ci_type;
    String ci_id;
    double ci_rate;
    String ci_brand;
    String ci_img;
    int ci_quan;
    Function inc;
    Function dec;
    int counter=1;
    CartItem({this.ci_name,this.ci_brand,this.ci_id,this.ci_rate,this.ci_type,this.ci_img,this.ci_quan,this.inc,this.dec});
    Widget build(BuildContext context) {
      return Card(
          child: Container(
           // padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          
            height: 100,
            child: Row(
              
              children: <Widget>[
             
                 Container(
                      margin: EdgeInsets.symmetric(horizontal:15,vertical:15),
                      height:80,
                      width:80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/$ci_img'),
                          
                        ),
                      ),
                    ),

               Container(
                  width: 270,
                  margin: EdgeInsets.only(left: 10,top: 17),
                 child: Column(
      
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 
                   children: <Widget>[
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: <Widget>[
                      Text('$ci_name',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                       fontFamily: 'Raleway',
                     ),
                     ),
                     Text('$ci_id',style: TextStyle(
                      fontSize: 12,
                      color: Colors.blue[200],
                      fontWeight: FontWeight.bold,
                       fontFamily: 'Amaranth',
                     ),
                     ),

                   ],
                   
                   ),
                   SizedBox(height: 2,),
                   Text('$ci_brand',style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent[100],
                     fontFamily: 'Raleway',
                   ),
                   ),
                   SizedBox(height: 3,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: <Widget>[
                      Row(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top:5),
                          child: Text('₹',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Colors.deepPurple[900],
                           fontFamily: 'Raleway',
                     ),
                     ),
                      ),
                      Text('$ci_rate',style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: Colors.deepPurple[900],
                         fontFamily: 'Raleway',
                     ),
                     ),
                     SizedBox(width: 12,),
                     Padding(
                       padding: EdgeInsets.only(top:9),
                           child: Text('$ci_type',style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w900,
                          color: Colors.blueAccent[100],
                           fontFamily: 'Raleway',
                       ),
                       ),
                     ),
                      ],
                        
                      ),
                      Container(
               
               margin: EdgeInsets.symmetric(horizontal:5),
             
               child: Row(
                 children: <Widget>[
                GestureDetector(
                  onTap:inc,
                       child: Container(
                        height:22,
                        width:22,
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(5), 
                        
                      ),
                     child: Icon( 
                       Icons.add,
                       color:Colors.blueAccent ,
                       size:15,     
                          ),
                      
                   ),
                ),
                SizedBox(width: 7,),
              Container(
                child:Text('$ci_quan',
                style: TextStyle(
                 color:Colors.deepPurple[900],
                fontSize: 15, 
                fontFamily: 'Amaranth',
                fontWeight: FontWeight.bold,
                ),
                ), 
                ),
                SizedBox(width: 7,),
                GestureDetector(
                  onTap:dec, 
                       child: Container(
                        height:22,
                        width:22,
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(5),
                       
                        
                      ),
                     child: Icon( 
                       Icons.remove,
                       color:Colors.blueAccent ,
                       size: 15,
                            
                          ),
                      
                   ),
                ),
               
               ],
               ),
             ),
                     ],
                   ),
                 ],
                 ),
               ),
            
              
            ],
            ),
          ),
          );
    }
  }

  class EmptyCart extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Center(
              child: Container(
                child: Text('Cart is empty',style: TextStyle(fontSize: 15,color:Colors.black45),),
          
        ),
      );
    }
  }
 //String b_name=b_list[0];
  //      String b_brand=b_list[1];
  //      String b_id=b_list[2];
   //     String b_rate=b_list[3];
     //   String b_type=b_list[4];