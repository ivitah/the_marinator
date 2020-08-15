import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:themarinator/models/hometrial.dart';
import 'package:themarinator/pages/spirits2.dart';
import 'package:themarinator/widget/featured.dart';
import 'package:themarinator/models/details.dart';
//my imports
import 'package:themarinator/widget/title.dart';
import 'package:themarinator/widget/commons.dart';
import 'package:themarinator/widget/categories.dart';
import 'package:themarinator/models/products.dart';
import 'package:themarinator/widget/cart.dart';

import 'carttrial.dart';
List<products>productlist=[
  products(name:"8pm",ratings: 4.2,price: 730,old_price: 950,amount: "750ml",wishlist:true,image: "8pm.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
  products(name:"Glenfiddich",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "glenfiddich.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability:false),
  products(name:"Grants",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "grants.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
  products(name:"Hunters",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "hunters.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
  products(name:"William",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "william.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
];


class product_details extends StatefulWidget {
//my mathogothanio
//final ValueSetter<products>_valueSetter;

//hahahahahhahahahaha
 final product_detail_name;
  final product_detail_image;
  final product_detail_price;
  final product_detail_old_price;
  final product_detail_ratings;
  final product_detail_wishlist;
  final product_detail_amount;
  final product_detail_brand;
  final product_detail_details;
  final product_detail_quantity;
  final product_detail_availability;


  product_details(
      //this._valueSetter,
  {
    //hahahhahha
      this.product_detail_name,
      this.product_detail_image,
      this.product_detail_price,
      this.product_detail_old_price,
      this.product_detail_ratings,
      this.product_detail_wishlist,
      this.product_detail_amount,
      this.product_detail_details,
      this.product_detail_quantity,
      this.product_detail_brand,
      this.product_detail_availability
  });

  @override
  _product_detailsState createState() => _product_detailsState();
}

class _product_detailsState extends State<product_details> {

  //List<product_details> cart=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      //========================appbar==========================
      appBar: AppBar(
        elevation: 0.1,
        centerTitle: true,
        backgroundColor: Colors.grey,

        title:new Text(widget.product_detail_name,
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
                Navigator.push(context,MaterialPageRoute(builder:(context)=>new TialHome(
                  icart_name:widget.product_detail_name,
                  icart_image:widget.product_detail_image,
                  icart_price:widget.product_detail_price,
                  icart_old_price:widget.product_detail_old_price,
                  icart_amount:widget.product_detail_amount,
                  icart_wishlist:widget.product_detail_wishlist,
                  icart_quantity:widget.product_detail_quantity,
                  icart_availability:widget.product_detail_availability,
                  icart_ratings:widget.product_detail_ratings,
                  icart_brand:widget.product_detail_brand,
                  icart_details:widget.product_detail_details,
                )));

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




      //=============the body===========
      body: ListView(
        children: <Widget>[
       Container(
      height: MediaQuery.of(context).size.height * 0.5,
        child: GridTile(
          child: Container(
            height:370,
            // child: widget.products[index].image,
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("images/${widget.product_detail_image}",
                height:MediaQuery.of(context).size.height * 0.6,
                width:MediaQuery.of(context).size.width * 0.5,),
            ),
          ),
        ),
      ),
      new Card(
        child: new Container(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Text(widget.product_detail_name,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          textBaseline:null ,
                        ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:12.0,top:8.0,bottom: 8.0,right: 20.0),
                      child: Text(widget.product_detail_amount,style: TextStyle(
                          backgroundColor: Colors.black87,color: Colors.white,
                          fontSize: 20.0),),
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),

                MaterialButton(onPressed: (){
                  showDialog(context:context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text("Quantity"),
                        content: new Text("Select Quantity"),
                        actions: <Widget>[
                          new MaterialButton(onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                            child:new Text("Close",style: TextStyle(color: Colors.lightBlue),),

                          )
                        ],
                      );
                    },
                  );
                },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.4,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Quantity",
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      ),

                      //drop down button
                      Expanded(
                        child:new Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  //child: new Text(widget.product_detail_brand !=null? widget.product_detail_brand:'',
                 child: new Text("${widget.product_detail_brand}",
                 //child: new Text("${widget.product_detail_brand}",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),),
                ),

                SizedBox(height: 10.0,),
                Padding(
                  padding: const EdgeInsets.only(left:10.0),
                  child:new Text("Ksh. ${widget.product_detail_price}",
                    style: TextStyle(
                      color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0
                    ),
                  ),
                ),

                SizedBox(height: 20.0,),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left:10.0),
                      child:new Text("Ksh. ${widget.product_detail_old_price}",
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          fontSize: 20.0,
                        ),
                      ),
                    ),

                    //percentage discount shiet
                    SizedBox(width: 20.0,),

                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: new Text("-13% OFF",
                        style: TextStyle(
                          backgroundColor: Colors.orange[100],
                          color: Colors.deepOrange,
                          fontSize: 20.0,
                        ),),
                    )
                  ],
                ),
                SizedBox(height: 20.0,),
//==============details========================================
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("Details",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18.0,
                    ),),
                ),

                SizedBox(height: 10.0,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(widget.product_detail_details!=null?widget.product_detail_details:'Default Value',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),),
                ),
                Divider(height: MediaQuery.of(context).size.height * 0.05,),



                //people also viewed shiet
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: customtext(text:"People also viewed",size: 20,),
                      ),
                      RaisedButton(onPressed:(){
                        onTap: () =>Navigator.of(context).push(new MaterialPageRoute(builder: (context) =>new spirits2(

                           spirit_image:widget.product_detail_image,
                           spirit_name:widget.product_detail_name,
                           spirit_price:widget.product_detail_price,
                           spirit_old_price:widget.product_detail_old_price,
                           spirit_amount:widget.product_detail_amount,
                           spirit_availability:widget.product_detail_availability,
                           spirit_ratings:widget.product_detail_ratings,
                           spirit_wishlist:widget.product_detail_wishlist,
                           spirit_details:widget.product_detail_details,



                        )));
                      },
                        child: new Text("view all...",
                        style: TextStyle(
                          color: Colors.blue,
                        ),),
                        color:Colors.white,
                      ),
                    ],
                  ),
                ),

                new Container(
                  height:MediaQuery.of(context).size.height * 0.42,
                  child: Similar_single_prod(),
                ),
                Divider(),
              ],
            )
        ),
      ),

      ],
      ),

      //===============bottom navigation bar=================
      bottomNavigationBar:new Container(
        child:Row(
          children: <Widget>[
            Expanded(
              child:MaterialButton(onPressed: (){},
                color: Colors.red,
                textColor: Colors.white,
                elevation: 0.5,
                child:new Text("Order now",
                  style: TextStyle(
                    fontSize: 20.0,),),
              ),
            ),

            //=======================heeeeeeeeeeeereeeeeeeeeeeeeeeeeeeeeeee
            new IconButton(icon: Icon(Icons.add_shopping_cart),color: Colors.red,onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder:(context)=>new TialHome(
                icart_name:widget.product_detail_name,
                icart_image:widget.product_detail_image,
                icart_price:widget.product_detail_price,
                icart_old_price:widget.product_detail_old_price,
                icart_amount:widget.product_detail_amount,
                icart_wishlist:widget.product_detail_wishlist,
                icart_quantity:widget.product_detail_quantity,
                icart_availability:widget.product_detail_availability,
                icart_ratings:widget.product_detail_ratings,
                icart_details:widget.product_detail_details,
              )));

            },
            ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child:widget.product_detail_wishlist? Icon(
    Icons.favorite,
    color:Colors.red ,):Icon(Icons.favorite_border,
    color:Colors.red ,)
    ),


          ],
        ),
      ),


    );
  }
}
/*class similar_Products extends StatefulWidget {
  @override
  _similar_ProductsState createState() => _similar_ProductsState();
}

class _similar_ProductsState extends State<similar_Products> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productlist.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index,) {
        return Similar_single_prod(
          prod_name: productlist[index].name,
          prod_picture: productlist[index].image,
          prod_old_price: productlist[index].old_price,
          prod_price: productlist[index].price,
          prod_amount: productlist[index].amount,
          prod_wishlist: productlist[index].wishlist,
          prod_ratings: productlist[index].ratings,
        );
      },
    );
  }
}*/
class Similar_single_prod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(

        child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:productlist.length,
        itemBuilder: (_, index) {
          return Hero(tag: productlist[index].name,
            child: Material(
            child: InkWell(
              //so now we creating a thingie such that when we tap it takes us to da next levelll

              onTap: () =>
                  Navigator.of(context).push(
                      new MaterialPageRoute(builder: (context) =>
                      new product_details(
                        //passing the details from popular to product kosokoso

                        product_detail_name: productlist[index].name,
                        product_detail_image: productlist[index].image,
                        product_detail_old_price: productlist[index].old_price,
                        product_detail_price: productlist[index].price,
                        product_detail_amount: productlist[index].amount,
                        product_detail_wishlist: productlist[index].wishlist,
                        product_detail_details: productlist[index].details,
                        product_detail_brand: productlist[index].brand,
                        product_detail_availability: productlist[index].availability,
                      )
                      )
                  ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                 // height: 300.0,
                  width: MediaQuery.of(context).size.width * 0.5,
                 // width: 250,
                  decoration: BoxDecoration(
                      color: white,
                      boxShadow: [ BoxShadow(
                        color: Colors.blueGrey[50],
                        offset: Offset(14.0, 4.0),
                        blurRadius: 30.0,
                      )
                      ]
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                   // height: 300.0,
                    width: MediaQuery.of(context).size.width * 0.459,
                   // width: 230,
                    decoration: BoxDecoration(
                        color: white,
                        boxShadow: [ BoxShadow(
                          color: Colors.blueGrey[50],
                          offset: Offset(17.0, 4.0),
                          blurRadius: 100.0,
                        )
                        ]
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("images/${productlist[index].image}",
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.height * 0.3,),
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AutoSizeText( productlist[index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0
                                ),
                                ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, top: 8.0, bottom: 8.0, right: 20.0),
                              child: Text(productlist[index].amount,
                                style: TextStyle(backgroundColor: Colors.black87,
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
                                    text: productlist[index].ratings.toString(),
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
                                      child: productlist[index].wishlist ? Icon(
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
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: customtext(
                                  text: "Ksh. ${productlist[index].price}",
                                  weight: FontWeight.bold,),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Ksh. ${productlist[index].old_price}",
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough),),
                              ),
                              /*new Text(productlist[index].brand,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),),*/

                            ],

                          ),
                        ),

                      ],
                    ),
                  ),


                  //below is original fail 1
                  /*child: Column(
                  children: <Widget>[
                    Image.asset("images/${prod_picture!=null?prod_picture:''}",height: 120.0,width: 120.0,),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: customtext(text:prod_name!=null?prod_name:'',weight: FontWeight.bold,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:12.0,top:8.0,bottom: 8.0,right: 20.0),
                          child: Text(prod_amount!=null?prod_amount:'',style: TextStyle(backgroundColor: Colors.black87,color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left:8.0,right: 8.0),
                              child: customtext(text:prod_ratings.toString(),size: 14,),
                            ),
                            SizedBox(height: 2.0,),
                            Icon(Icons.star,color: red,size: 16,),
                            Icon(Icons.star,color: red,size: 16,),
                            Icon(Icons.star,color: red,size: 16,),
                            Icon(Icons.star,color: red,size: 16,),
                            Icon(Icons.star,color:grey,size: 16,),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:BorderRadius.circular(20.0),
                                color: white,
                                boxShadow:[ BoxShadow(
                                  color:Colors.grey[300],
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 4.0,
                                )
                                ]
                            ),

                            child: Padding(padding: EdgeInsets.all(4.0),
                              child:Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: prod_wishlist!=true? Icon(
                                    Icons.favorite,
                                    size: 16,
                                    color:Colors.red ,):Icon(Icons.favorite_border,
                                    size: 16,
                                    color:Colors.red ,)
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
                          padding: const EdgeInsets.only(left:10.0),
                          child: customtext(text: "Ksh. ${prod_price}",weight: FontWeight.bold,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:Text( "Ksh. ${prod_old_price}",style: TextStyle(decoration:TextDecoration.lineThrough),),
                        ),
                        /*new Text(productlist[index].brand,
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),),*/

                      ],

                    ),

                  ],
                ),*/
                ),
              ),

            ),
          ),
          );
        }
      ),
    );
  }
}
