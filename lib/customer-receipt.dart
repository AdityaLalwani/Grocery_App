import 'package:flutter/material.dart' ;

import 'package:trolleygo_app/CartConst.dart';
import 'Home-page.dart';


 double del=40.0;



class CustomerReceipt extends StatefulWidget {

  static String id='customer-receipt';



  @override
  _CustomerReceiptState createState() => _CustomerReceiptState();
}

class _CustomerReceiptState extends State<CustomerReceipt> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple[900],
        title: Text('Customer Receipt',
        style: TextStyle(color: Colors.white,fontFamily: 'Raleway',letterSpacing: -0.4,fontWeight: FontWeight.bold),
        ),
        
        ),
        body: 
             Column(
               children: <Widget>[
 Container(
                 margin: EdgeInsets.symmetric(horizontal:25,vertical:30),
                 height: 500,
                 width:double.infinity,
                 
                 decoration: BoxDecoration(
                  image: DecorationImage(fit:BoxFit.cover,image: AssetImage('assets/images/tests1.jpg'),),
                  borderRadius: BorderRadius.circular(7),
                  
                  
                  
                ),
            child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top:10,left:15),
                    child: Text('ORDER NO. #12345',
                    style: TextStyle(
                      fontFamily: 'MontserratB',
                      fontSize: 20,
                      letterSpacing: -0.5,
                      color: Colors.black54,
                    ),
                    ),
                  
                  ),
                  SizedBox(height: 30,),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical:5,horizontal:15),
                                    child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: <Widget>[
                            Text('PRODUCTS',style: TextStyle(
                            fontSize: 17,
                          
                            color: Colors.black54,
                             fontFamily: 'MontserratB',
                           ),
                           ),
                           Text('PRICE',style: TextStyle(
                            fontSize: 17,
                            color: Colors.black54,
                           
                             fontFamily: 'MontserratB',
                           ),
                           ),

                         ],
                         
                         ),
                  ),
                
                  Divider(),
                  
                  Expanded(child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (BuildContext,int index)=>
                    OrderItem(ci_name:products[index].cc_name,
                    ci_rate:products[index].cc_rate*products[index].cc_quan,
                    ci_qn:products[index].cc_quan),
                    
                    ),

                    
                    
                    ),
                   
                  Padding(
                    padding: EdgeInsets.symmetric(vertical:5,horizontal:15),
                          child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: <Widget>[
                            Text('Sub Total:',style: TextStyle(
                            fontSize: 12,
                          
                            color: Colors.black54,
                             fontFamily: 'MontserratB',
                           ),
                           ),
                           Text('Rs. $cart_tot',style: TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                           
                             fontFamily: 'MontserratB',
                           ),
                           ),

                         ],
                         
                         ),
                  ),
                   Padding(
                    padding: EdgeInsets.symmetric(vertical:5,horizontal:15),
                          child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: <Widget>[
                            Text('Delivery Charges:',style: TextStyle(
                            fontSize: 12,
                          
                            color: Colors.black54,
                             fontFamily: 'MontserratB',
                           ),
                           ),
                           Text('Rs. $del',style: TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                           
                             fontFamily: 'MontserratB',
                           ),
                           ),

                         ],
                         
                         ),
                  ),
                   Padding(
                    padding: EdgeInsets.symmetric(vertical:5,horizontal:15),
                                    child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: <Widget>[
                            Text('Tax:',style: TextStyle(
                            fontSize: 12,
                          
                            color: Colors.black54,
                             fontFamily: 'MontserratB',
                           ),
                           ),
                           Text('Rs. ${cart_tot*0.05}',style: TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                           
                             fontFamily: 'MontserratB',
                           ),
                           ),
                          
                           

                         ],
                         
                         ),
                  ),
                   Divider(height: 5,),
                   Padding(
                    padding: EdgeInsets.symmetric(vertical:5,horizontal:15),
                            child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: <Widget>[
                            Text('Total:',style: TextStyle(
                            fontSize: 17,
                          
                            color: Colors.deepPurple[900],
                             fontFamily: 'MontserratB',
                           ),
                           ),
                           Text('Rs. ${cart_tot+del+cart_tot*0.05}',style: TextStyle(
                            fontSize: 17,
                            color: Colors.deepPurple[900],
                           
                             fontFamily: 'MontserratB',
                           ),
                           ),

                         ],
                         
                         ),
                  ),
                  SizedBox(height: 10,),
                 
                 
                  
          ],
          

          ),
        ),
        Container(height: 150,width:150,
        child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/bread.png'),
                  ), 
        ),
               ],
                
             ),
        
      
    );
  }
}
class OrderItem extends StatelessWidget {
  @override
   String ci_name;
   double ci_rate;
    int ci_qn;

    OrderItem({this.ci_name,this.ci_rate,this.ci_qn});
  Widget build(BuildContext context) {
    return         
                        Padding(
                          padding: EdgeInsets.symmetric(vertical:5,horizontal:15),
                       child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: <Widget>[
                          Text('$ci_name   x$ci_qn',style: TextStyle(
                          fontSize: 15,
                      
                          color: Colors.deepPurple[900],
                           fontFamily: 'MontserratB',
                       ),
                       ),
                       Text('Rs. $ci_rate',style: TextStyle(
                          fontSize: 15,
                          color: Colors.deepPurple[900],
                       
                           fontFamily: 'MontserratB',
                       ),
                       ),

                     ],
                     
                     ),
                        );
                

  }
}