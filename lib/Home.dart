import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'CartConst.dart';
import 'package:trolleygo_app/Home-page.dart';

class CartPage extends StatefulWidget {
  @override
  static String id = 'cart-page';
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _fire = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple[900],
        title: Text(
          'Catalogue',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Raleway',
              letterSpacing: -0.4,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: StreamBuilder(
            stream: _fire.collection('products').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blueAccent,
                  ),
                );
              }
              final productss = snapshot.data.documents;
              List<FlipCard> proCards = [];
              for (var product in productss) {
                final pro_im = product.data['p_img'];
                final pro_br = product.data['pro_brand'];
                final pro_idn = product.data['pro_id'];
                final pro_nm = product.data['pro_name'];
                final pro_r = product.data['pro_rate'];
                final pro_rt = product.data['pro_rtype'];

                final cproduct = FlipCard(
                  direction: FlipDirection.VERTICAL,
                  front: Stackcard(
                    img: pro_im,
                    pro_name: pro_nm,
                    pro_brand: pro_br,
                    pro_id: pro_idn,
                    pro_c: pro_r,
                    pro_cb: pro_rt,
                    addc: () {
                      setState(() {
                        var item = cartcon(
                            cc_name: pro_nm,
                            cc_brand: pro_br,
                            cc_id: pro_idn,
                            cc_rate: double.parse(pro_r),
                            cc_type: pro_rt,
                            cc_img: pro_im,
                            cc_quan: 1);
                        products.add(item);
                        cart_tot = cart_tot + double.parse(pro_r);
                      });
                    },
                  ),
                  back: Stackcard(
                      img: pro_im,
                      pro_name: pro_nm,
                      pro_brand: pro_br,
                      pro_id: pro_idn,
                      pro_c: pro_r,
                      pro_cb: pro_rt),
                );
                proCards.add(cproduct);
              }
              return GridView.count(
                padding: EdgeInsets.only(top: 80),
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 75,
                children: proCards,
              );
            }),
      ),
    );
  }
}

class Stackcard extends StatelessWidget {
  @override
  final String pro_name;
  final String pro_brand;
  final String pro_c;
  final String pro_id;
  final String img;
  final String pro_cb;
  Function addc;
  Stackcard(
      {this.img,
      this.pro_name,
      this.pro_brand,
      this.pro_id,
      this.pro_c,
      this.pro_cb,
      this.addc});
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
            overflow: Overflow.visible,
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              SizedBox(
                height: 180,
                width: 200,
                child: Card(
                    elevation: 4,
                    child: Container(
                      padding: EdgeInsets.only(top: 75, left: 13, right: 13),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                '$pro_name',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                '$pro_id',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'OpenSans',
                                  color: Colors.blueAccent[100],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                '$pro_brand',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent[100],
                                ),
                              ),
                              Text(
                                '$pro_cb',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'OpenSans',
                                  color: Colors.blueAccent[100],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                '₹$pro_c',
                                style: TextStyle(
                                  fontSize: 19,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              GestureDetector(
                                onTap: addc,
                                child: InkWell(
                                  child: Container(
                                    height: 25,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.lightBlueAccent,
                                          Colors.blueAccent
                                        ],
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
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
              Positioned(
                top: -75,
                child: SizedBox(
                  height: 150,
                  width: 180,
                  child: Card(
                    elevation: 1,
                    child: Container(
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/$img'),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
