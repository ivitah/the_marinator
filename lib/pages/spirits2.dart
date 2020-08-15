import 'package:flutter/material.dart';
import 'package:themarinator/models/products.dart';

import 'package:themarinator/pages/product_details.dart';
import 'package:themarinator/widget/commons.dart';
import 'package:themarinator/widget/title.dart';

import 'carttrial.dart';

List<products>productlist=[
  products(name:"8pm",ratings: 4.2,price: 730,old_price: 950,amount: "750ml",wishlist:true,image: "8pm.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
  products(name:"Glenfiddich",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "glenfiddich.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability:false),
  products(name:"Grants",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "grants.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
  products(name:"Grants",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "grants.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
  products(name:"Grants",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "grants.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
  products(name:"Grants",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "grants.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
  products(name:"Grants",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "grants.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
  products(name:"Grants",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "grants.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
  products(name:"Grants",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "grants.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
  products(name:"Grants",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "grants.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
  products(name:"Grants",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "grants.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
  products(name:"Grants",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "grants.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
  products(name:"Grants",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "grants.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
  products(name:"Hunters",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "hunters.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
  products(name:"William",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "william.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
];

class spirits2 extends StatefulWidget {
  final spirit_name;
  final spirit_image;
  final spirit_price;
  final spirit_amount;
  final spirit_old_price;
  final spirit_wishlist;
  final spirit_ratings;
  final spirit_brand;
  final spirit_details;
  final spirit_availability;


  spirits2({
    this.spirit_name,
    this.spirit_image,
    this.spirit_price,
    this.spirit_amount,
    this.spirit_old_price,
    this.spirit_wishlist,
    this.spirit_ratings, this.spirit_brand, this.spirit_details, this.spirit_availability
}
      );

  @override
  _spirits2State createState() => _spirits2State();
}

class _spirits2State extends State<spirits2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        centerTitle: true,
        backgroundColor: Colors.grey,

        title:new Text("Spirits",
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
              IconButton(icon:Icon(Icons.shopping_cart,color:white,), onPressed:(){
                Navigator.push(context,MaterialPageRoute(builder:(context)=>new TrialHome()));

              }),
              Positioned(
                top: 8.0,
                right: 12.0,
                child: Container(
                  height: 12.0,
                  width: 12.0,
                  decoration: BoxDecoration(
                    color:red,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Center(
                    child: Text("2",style: TextStyle(fontSize: 8.5),),
                  ),
                ),
              )
            ],
          )
        ],
      ),

      body:Stack(
        children: <Widget>[

          Container(
            height: 300.0,

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
            child: Container(
              child: Image.asset(

                "images/${widget.spirit_image}", height: 140.0,

                width: 140.0,),
            ),
          ),
    GridView.builder(


    itemCount: productlist.length,

    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 2.0,mainAxisSpacing: 2.0),


    itemBuilder: (BuildContext context, int index,)
          {
            return
            Stack(
              children: <Widget>[
             InkWell(onTap: () =>Navigator.of(context).push(new MaterialPageRoute(builder: (context) =>new product_details(

              product_detail_image: widget.spirit_image,

              product_detail_name: widget.spirit_name,

              product_detail_amount: widget.spirit_amount,

              product_detail_price: widget.spirit_price,

              product_detail_old_price: widget.spirit_old_price,

              product_detail_wishlist:widget.spirit_wishlist,

              product_detail_brand: widget.spirit_brand,

              product_detail_ratings: widget.spirit_ratings,

              product_detail_details: widget.spirit_details,

              product_detail_availability: widget.spirit_availability,

            ))),

              child: singles(
              Single_image:productlist[index].image,
              Single_name:productlist[index].name,
              Single_wishlist:productlist[index].wishlist,
              Single_price:productlist[index].price,
              Single_old_price:productlist[index].old_price,
              Single_amount:productlist[index].amount,
              Single_ratings:productlist[index].ratings,

              Single_details:productlist[index].details,
              Single_availability:productlist[index].availability,
            ),
             ),
              ],

    );
          }
          ),


        ],
      ),
    );
  }
}

class singles extends StatelessWidget {
  final Single_name;
  final Single_image;
  final Single_price;
  final Single_old_price;
  final Single_ratings;
  final Single_wishlist;
  final Single_amount;
  final Single_brand;
  final Single_details;
  final Single_quantity;
  final Single_availability;


  singles({
    this.Single_name,
    this.Single_image,
    this.Single_price,
    this.Single_old_price,
    this.Single_ratings,
    this.Single_wishlist,
    this.Single_amount,
    this.Single_brand,
    this.Single_details,
    this.Single_quantity,
    this.Single_availability
}
      );

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return
    Container(
      child: Column(
        children: <Widget>[
          Row(

            children: <Widget>[

              Padding(

                padding: const EdgeInsets.all(8.0),

                child: customtext(text:Single_name,

                  weight: FontWeight.bold,),

              ),

              Padding(

                padding: const EdgeInsets.only(

                    left: 12.0, top: 8.0, bottom: 8.0, right: 20.0),

                child: Text(Single_amount, style: TextStyle(

                    backgroundColor: Colors.black87,

                    color: Colors.white),),

              ),

            ],

          ),

          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: <Widget>[

              Row(

                children: <Widget>[

                  Padding(

                    padding: const EdgeInsets.only(

                        left: 8.0, right: 8.0),

                    child: customtext(

                      text:Single_ratings.toString(),

                      size: 14,),

                  ),

                  SizedBox(height: 2.0,),

                  Icon(Icons.star, color: red, size: 16,),

                  Icon(Icons.star, color: red, size: 16,),

                  Icon(Icons.star, color: red, size: 16,),

                  Icon(Icons.star, color: red, size: 16,),

                  Icon(Icons.star, color: grey, size: 16,),

                ],

              ),

              Padding(

                padding: const EdgeInsets.all(8.0),

                child: Container(

                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(20.0),

                      color: white,

                      boxShadow: [ BoxShadow(

                        color: Colors.grey[300],

                        offset: Offset(1.0, 1.0),

                        blurRadius: 4.0,

                      )

                      ]

                  ),



                  child: Padding(padding: EdgeInsets.all(4.0),

                    child: Padding(

                        padding: const EdgeInsets.all(8.0),

                        child:Single_wishlist? Icon(

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

                padding: const EdgeInsets.only(left: 10.0),

                child: customtext(

                  text: "Ksh. ${Single_price}",

                  weight: FontWeight.bold,),

              ),

              Padding(

                padding: const EdgeInsets.all(8.0),

                child: Text("Ksh. ${Single_old_price}",

                  style: TextStyle(

                      decoration: TextDecoration.lineThrough),),

              ),





            ],

            /*new Text(productlist[index].brand,

                                  style: TextStyle(

                                    fontSize: 18.0,

                                  ),),*/

          ),
        ],
      ),
    );

  }
}

