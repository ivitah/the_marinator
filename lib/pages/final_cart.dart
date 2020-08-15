import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:themarinator/models/products.dart';
import 'package:themarinator/pages/product_details.dart';
import 'package:themarinator/pages/signin.dart';
import 'package:themarinator/sha/services/provider.dart';
import 'package:themarinator/widget/commons.dart';
import 'package:themarinator/widget/title.dart';

List<products>productlist = [
  products(name: "8pm",
      ratings: 4.2,
      quantity: 4,
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
      quantity: 4,
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
      quantity: 4,
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
      quantity: 4,
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
      quantity: 4,
      price: 830,
      old_price: 1050,
      amount: "750ml",
      wishlist: true,
      image: "william.jpg",
      brand: "kingstone",
      details: "The most celebrated brandy yeah",
      availability: true),
];


class finalCart extends StatefulWidget {
  @override
  _finalCartState createState() => _finalCartState();
}

class _finalCartState extends State<finalCart> {
  List picked = [false, false];
  var i;
  int total = 0;

  pickToggle(index) {
    setState(() {
      picked[index] = !picked[index];
      getTotal();
    });
  }

  getTotal() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("My Drinking Cart",
            style: TextStyle(fontSize: 21.0, color: Colors.black),
          ),
        ),),
      //  iconTheme: Colors.,),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                //  children: <Widget>[
                scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                shrinkWrap: true,
                  itemCount: productlist.length,
                  itemBuilder: (_, index) {
                        return Hero(tag: productlist[index].name,
                          child: Material(
                            elevation: 0.0,

                            //color: Colors.white70,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Container(
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.27,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [ BoxShadow(
                                        color: Colors.blueGrey[50],
                                        offset: Offset(14.0, 4.0),
                                        blurRadius: 5.0,
                                      ),
                                      ],),

                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(left: 5.0),
                                              child: InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  height: MediaQuery
                                                      .of(context)
                                                      .size
                                                      .height * 0.025,
                                                  // height: 25.0,
                                                  width: MediaQuery
                                                      .of(context)
                                                      .size
                                                      .width * 0.05,
                                                  //width: 25.0,
                                                  decoration: BoxDecoration(
                                                    color:productlist[index].availability ?
                                                    Colors.grey.withOpacity(0.4)
                                                        : Colors.red.withOpacity(0.4),
                                                    borderRadius: BorderRadius.circular(
                                                        12.5),
                                                  ),
                                                  child: Center(
                                                    child:productlist[index].availability ?
                                                    Container(
                                                      height: MediaQuery
                                                          .of(context)
                                                          .size
                                                          .height * 0.0149,
                                                      width: MediaQuery
                                                          .of(context)
                                                          .size
                                                          .width * 0.025,
                                                      decoration: BoxDecoration(
                                                        color: Colors.yellow,
                                                        borderRadius: BorderRadius
                                                            .circular(6.0),
                                                      ),
                                                    ) : Container(),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () =>
                                                  Navigator.of(context).push(
                                                    new MaterialPageRoute(
                                                      builder: (context) =>
                                                      new product_details(
                                                        product_detail_name: productlist[index].name,
                                                        product_detail_image: productlist[index].image,
                                                        product_detail_old_price: productlist[index].old_price,
                                                        product_detail_price: productlist[index].price,
                                                        product_detail_amount: productlist[index].amount,
                                                        product_detail_wishlist: productlist[index].wishlist,
                                                        product_detail_details: productlist[index].details,
                                                        product_detail_brand: productlist[index].brand,
                                                        product_detail_availability: productlist[index].availability,
                                                      ),),

                                                  ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: Container(
                                                  width: MediaQuery
                                                      .of(context)
                                                      .size
                                                      .width * 0.25,
                                                  // width: 100.0,
                                                  height: MediaQuery
                                                      .of(context)
                                                      .size
                                                      .height * 0.19,
                                                  // height: 120.0,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage("images/${productlist[index].image}"),

                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: MediaQuery
                                                .of(context)
                                                .size
                                                .width * 0.004,),
                                            Column(
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .start,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(productlist[index].name,
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 18.0,
                                                            fontFamily: 'Quicksand'
                                                        ),),
                                                    ),
                                                    SizedBox(width: MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width * 0.08,),
                                                    Text(productlist[index].amount,
                                                      style: TextStyle(
                                                          backgroundColor: Colors.black87,
                                                          color: Colors.white,
                                                          fontSize: 16.0),),

                                                  ],
                                                ),
                                                SizedBox(height: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .height * 0.002,),

                                                  productlist[index].availability ?
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .start,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                          left: 10.0),
                                                      child: Text(
                                                        "Ksh. ${productlist[index].price}",
                                                        style: TextStyle(fontSize: 18.0,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.red),),
                                                    ),
                                                    SizedBox(width: MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width * 0.005,),

                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(
                                                        "Ksh. ${productlist[index].old_price}",
                                                        style: TextStyle(
                                                            decoration: TextDecoration
                                                                .lineThrough,
                                                            color: Colors.grey,
                                                            fontSize: 16.0),),
                                                    ),
                                                  ],
                                                ) : OutlineButton(onPressed: () {},
                                                  borderSide: BorderSide(
                                                    width: 1.0,
                                                    color: Colors.red,
                                                    style: BorderStyle.solid,
                                                  ),
                                                  child: Center(
                                                    child: Text("OUT OF STOCK",
                                                      style: TextStyle(
                                                        fontFamily: 'Quicksand',
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 18.0,
                                                        color: red,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .height * 0.0005,),
                    productlist[index].availability ?
                                                Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                          left: 8.0, right: 8.0),
                                                      child: customtext(
                                                        text: productlist[index].ratings.toString(),
                                                        size: 14,),
                                                    ),
                                                    SizedBox(height: MediaQuery
                                                        .of(context)
                                                        .size
                                                        .height * 0.002,),
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

                                                    SizedBox(width: MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width * 0.08,),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .circular(20.0),
                                                          color: white,
//                                    boxShadow:[ BoxShadow(
//                                      color:Colors.grey[300],
//                                      offset: Offset(1.0, 1.0),
//                                      blurRadius: 4.0,
//                                    )
//                                    ]
                                                        ),


                                                        child: Padding(
                                                          padding: EdgeInsets.all(4.0),
                                                          child: Padding(
                                                              padding: const EdgeInsets
                                                                  .all(8.0),
                                                              child:  productlist[index].wishlist ?
                    Icon(
                                                                Icons.favorite,
                                                                size: 16,
                                                                color: Colors.red,)
                                                                  : Icon(
                                                                Icons.favorite_border,
                                                                size: 16,
                                                                color: Colors.red,)
                                                          ),
                                                          // productlist[index].ratings,Icon(Icons.favorite_border
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ) : Row()


                                              ],
                                            ),
                                          ],
                                        ),
                                        Divider(height: MediaQuery
                                            .of(context)
                                            .size
                                            .height * 0.00000005,),
                                                    productlist[index].availability ?

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceEvenly,
                                          children: <Widget>[
                                            Container(
                                              // width: MediaQuery.of(context).size.width* 0.008,
                                              width: 15.0,
                                              // height: MediaQuery.of(context).size.height * 0.008,
                                              height: 15.0,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[300],
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              child: Icon(
                                                Icons.remove, color: Colors.black,
                                                size: 15.0,),
                                              //onPressed: (){}),
                                            ),
                                            SizedBox(width: MediaQuery
                                                .of(context)
                                                .size
                                                .width * 0.006,),

                                            Text("${ productlist[index].quantity}",
                                              style: TextStyle(color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0,),),
                                            SizedBox(width: 8.0,),

                                            Container(
                                              //width: MediaQuery.of(context).size.width * 0.008,
                                              width: 15.0,
                                              //height: MediaQuery.of(context).size.height * 0.008,
                                              height: 15.0,
                                              decoration: BoxDecoration(
                                                color: Colors.blue[300],
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              child: Icon(Icons.add, color: Colors.black,
                                                size: 15.0,),
                                              //onPressed: (){}),
                                            ),

                                            SizedBox(width: MediaQuery
                                                .of(context)
                                                .size
                                                .width * 0.007,),


                                            FlatButton(
                                              onPressed: () {},
                                              child: Text("Remove", style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold),),
                                              color: Colors.grey[50],
                                            ),
                                            //IconButton(icon:Icon(Icons.delete), onPressed:(){},


                                          ],
                                        ) : Row()

                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                  }
              ),
            ),
            Divider(),
            SizedBox(height: 20.0,),
            Divider(),


            Container(
              child: Column(
                  children: <Widget>[

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Total",style: TextStyle(fontSize: 23.0,
                            color: Colors.grey,
                            //fontWeight: FontWeight.bold,
                          ),),
                        ),
                        Text("Ksh.${2290}",style: TextStyle(fontSize: 23.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87
                        ),
                        ),

                      ],
                    ),
                    SizedBox(height: 5.0,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Delivery charges",style: TextStyle(fontSize: 17.0,
                            color: Colors.grey,
                          ),),
                        ),
                        Text("Ksh.${35}",style: TextStyle(fontSize:17.0,
                            color: Colors.black87
                        ),),

                      ],
                    ),
                    Divider(),

                    SizedBox(height: 5.0,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("SubTotal",style: TextStyle(fontSize: 20.0,
                            color: Colors.grey,

                            //fontWeight: FontWeight.bold,
                          ),),
                        ),
                        Text("Ksh.${2240}",style: TextStyle(fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),),

                      ],
                    ),
                  ]
              )
              ,
            ),
          ],
        ),
      ),

      bottomNavigationBar: new Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),

        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: ListTile(
                title: new Text("Total:", style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold
                ),),
                subtitle: new Text("Ksh.${12000}",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 19.0,
                  ),),

              ),),
            Expanded(
              flex:12,
              child: Container(
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(90.0)
                ),
//                child: MaterialButton(onPressed: (){},
//                  color: Colors.red,
//                  textColor: Colors.white,
//                  elevation: 0.5,
//                  child:Padding(
//                    padding: const EdgeInsets.all(9.0),
//                    child: new Text("Proceed to checkOut",
//                      style: TextStyle(
//                        fontSize: 23.0,),),
//                  ),
//                ),
                child: GestureDetector(
                  onTap: () =>
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => new signin())),

                  child: Center(
                    child: Text("CheckOut", style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 19.0,
                    ),),
                  ),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}

//                    itemCart(
////                      itcart_name: widget.icart_name,
////                      itcart_image: widget.icart_image,
////                      itcart_price: widget.icart_price,
////                      itcart_old_price: widget.icart_old_price,
////                      itcart_quantity: widget.icart_quantity,
////                      itcart_amount: widget.icart_amount,
////                      itcart_wishlist: widget.icart_wishlist,
////                      itcart_availability: widget.icart_availability,
////                      itcart_ratings: widget.icart_ratings,
////                      itcart_details: widget.icart_details,
////                      itcart_brand: widget.icart_brand,
//                    ),