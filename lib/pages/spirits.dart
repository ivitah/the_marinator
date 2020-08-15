import 'package:flutter/material.dart';
import 'package:themarinator/models/products.dart';
import 'package:themarinator/pages/product_details.dart';
import 'package:themarinator/widget/commons.dart';
import 'package:themarinator/widget/title.dart';

import 'carttrial.dart';

List<products>productlist = [
  products(name: "8pm",
      ratings: 4.2,
      price: 730,
      old_price: 950,
      amount: "750ml",
      wishlist: true,
      image: "8pm.jpg",
      brand: "kingstone",
      details: "The most celebrated brandy yeah",
      availability: true),
  products(name: "Glenfiddich",
      ratings: 4.2,
      price: 830,
      old_price: 1050,
      amount: "750ml",
      wishlist: true,
      image: "glenfiddich.jpg",
      brand: "kingstone",
      details: "The most celebrated brandy yeah",
      availability: false),
  products(name: "Grants",
      ratings: 4.2,
      price: 830,
      old_price: 1050,
      amount: "750ml",
      wishlist: true,
      image: "grants.jpg",
      brand: "kingstone",
      details: "The most celebrated brandy yeah",
      availability: true),
  products(name: "Hunters",
      ratings: 4.2,
      price: 830,
      old_price: 1050,
      amount: "750ml",
      wishlist: true,
      image: "hunters.jpg",
      brand: "kingstone",
      details: "The most celebrated brandy yeah",
      availability: true),
  products(name: "William",
      ratings: 4.2,
      price: 830,
      old_price: 1050,
      amount: "750ml",
      wishlist: true,
      image: "william.jpg",
      brand: "kingstone",
      details: "The most celebrated brandy yeah",
      availability: true),
];

class spirits extends StatefulWidget {
  @override
  _spiritsState createState() => _spiritsState();
}

class _spiritsState extends State<spirits> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
     // ========================appbar==========================
      appBar: AppBar(
        elevation: 0.1,
        centerTitle: true,
        backgroundColor: Colors.grey,

        title: new Text("Spirits",
          style: TextStyle(
              color: Colors.black),
        ),
        actions: <Widget>[

          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {

              }),

          Stack(
            children: <Widget>[
              IconButton(icon: Icon(Icons.shopping_cart, color: white,),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => new TrialHome()));
                  }),
              Positioned(
                top: 8.0,
                right: 12.0,
                child: Container(
                  height: 12.0,
                  width: 12.0,
                  decoration: BoxDecoration(
                    color: red,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Center(
                    child: Text("2", style: TextStyle(fontSize: 8.5),),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      body: SafeArea(
        child: Card(

          elevation: 50.0,

          child: GridView.builder(


              itemCount: productlist.length,

              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 2.0,
                  childAspectRatio: 0.5),


              itemBuilder: (BuildContext context,

                  int index,) {
                return GridTile(
                  child: Padding(

                      padding: const EdgeInsets.all(4.0),

                      child: InkWell(

                        onTap: () =>

                            Navigator.of(context).push(

                                new MaterialPageRoute(builder: (context) =>

                                new product_details(

                                  product_detail_image: productlist[index]
                                      .image,

                                  product_detail_name: productlist[index].name,

                                  product_detail_amount: productlist[index]
                                      .amount,

                                  product_detail_price: productlist[index]
                                      .price,

                                  product_detail_old_price: productlist[index]
                                      .old_price,

                                  product_detail_wishlist: productlist[index]
                                      .wishlist,

                                  product_detail_brand: productlist[index]
                                      .brand,

                                  product_detail_ratings: productlist[index]
                                      .ratings,

                                  product_detail_details: productlist[index]
                                      .details,

                                  product_detail_availability: productlist[index]
                                      .availability,

                                ))

                            ),

                        child: Container(

                          height: 250.0,

                          width: 250,

                          decoration: BoxDecoration(

                              color: white,

                              boxShadow: [ BoxShadow(

                                color: Colors.grey[100],

                                offset: Offset(14.0, 4.0),

                                blurRadius: 30.0,

                              )

                              ]

                          ),

                          child: SingleChildScrollView(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(

                                        "images/${productlist[index].image}",
                                        height: 200.0,

                                        width: 140.0,),
                                    ),
                                  ),

                                  Row(

                                    children: <Widget>[

                                      Padding(

                                        padding: const EdgeInsets.all(8.0),

                                        child: customtext(
                                          text: productlist[index].name,

                                          weight: FontWeight.bold,),

                                      ),

                                      Padding(

                                        padding: const EdgeInsets.only(

                                            left: 12.0,
                                            top: 8.0,
                                            bottom: 8.0,
                                            right: 20.0),

                                        child: Text(productlist[index].amount,
                                          style: TextStyle(

                                              backgroundColor: Colors.black87,

                                              color: Colors.white),),

                                      ),

                                    ],

                                  ),

                                  Row(

                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,

                                    children: <Widget>[

                                      Row(

                                        children: <Widget>[

                                          Padding(

                                            padding: const EdgeInsets.only(

                                                left: 8.0, right: 8.0),

                                            child: customtext(

                                              text: productlist[index].ratings
                                                  .toString(),

                                              size: 14,),

                                          ),

                                          SizedBox(height: 2.0,),

                                          Icon(
                                            Icons.star, color: red, size: 16,),

                                          Icon(
                                            Icons.star, color: red, size: 16,),

                                          Icon(
                                            Icons.star, color: red, size: 16,),

                                          Icon(
                                            Icons.star, color: red, size: 16,),

                                          Icon(
                                            Icons.star, color: grey, size: 16,),

                                        ],

                                      ),

                                      Padding(

                                        padding: const EdgeInsets.all(8.0),

                                        child: Container(

                                          decoration: BoxDecoration(

                                              borderRadius: BorderRadius
                                                  .circular(20.0),

                                              color: white,

                                              boxShadow: [ BoxShadow(

                                                color: Colors.grey[300],

                                                offset: Offset(1.0, 1.0),

                                                blurRadius: 4.0,

                                              )

                                              ]

                                          ),


                                          child: Padding(
                                            padding: EdgeInsets.all(4.0),

                                            child: Padding(

                                                padding: const EdgeInsets.all(
                                                    8.0),

                                                child: productlist[index]
                                                    .wishlist ? Icon(

                                                  Icons.favorite,

                                                  size: 16,

                                                  color: Colors.red,) : Icon(

                                                  Icons.favorite_border,

                                                  size: 16,

                                                  color: Colors.red,)

                                            ),

                                            // productlist[index].ratings,Icon(Icons.favorite_border

                                          ),

                                        ),

                                      ),

                                    ],

                                  ),

                                  Row(

                                    children: <Widget>[

                                      Padding(

                                        padding: const EdgeInsets.only(
                                            left: 10.0),

                                        child: customtext(

                                          text: "Ksh. ${productlist[index]
                                              .price}",

                                          weight: FontWeight.bold,),

                                      ),

                                      Padding(

                                        padding: const EdgeInsets.all(8.0),

                                        child: Text("Ksh. ${productlist[index]
                                            .old_price}",

                                          style: TextStyle(

                                              decoration: TextDecoration
                                                  .lineThrough),),

                                      ),


                                    ],

                                    /*new Text(productlist[index].brand,

                                    style: TextStyle(

                                      fontSize: 18.0,

                                    ),),*/

                                  ),


                                ],

                              ),
                            ),
                          ),

                        ),

                      )

                  ),
                );
              }),

        ),
      ),

    );
  }
}
