import 'package:flutter/material.dart';
import 'file:///C:/Users/User/AndroidStudioProjects/flutter_project/the_marinator/lib/pages/product_details.dart';

import 'package:themarinator/widget/title.dart';
import 'package:themarinator/widget/commons.dart';
import 'package:themarinator/widget/categories.dart';
import 'package:themarinator/models/products.dart';

List<products>productlist=[
  products(name:"8pm",ratings: 4.2,price: 730,old_price: 950,amount: "750ml",wishlist:true,image: "8pm.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
  products(name:"Glenfiddich",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "glenfiddich.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: false),
  products(name:"Grants",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "grants.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
  products(name:"Hunters",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "hunters.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
  products(name:"William",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "william.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
];


class featured extends StatefulWidget {
  @override
  _featuredState createState() => _featuredState();
}

class _featuredState extends State<featured> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height:MediaQuery.of(context).size.height * 0.4,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,

          itemCount:productlist.length,
          itemBuilder: (_, index){
            return  Padding(
                padding: const EdgeInsets.all(8.0),
                child:InkWell(
                  onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>new product_details(
                    product_detail_image: productlist[index].image,
                    product_detail_name: productlist[index].name,
                    product_detail_amount: productlist[index].amount,
                    product_detail_price: productlist[index].price,
                    product_detail_old_price: productlist[index].old_price,
                    product_detail_wishlist: productlist[index].wishlist,
                    product_detail_brand: productlist[index].brand,
                    product_detail_ratings: productlist[index].ratings,
                    product_detail_details: productlist[index].details,
                    product_detail_availability: productlist[index].availability,
                  ))),
                  child: Container(
                    //MediaQuery.of(context).size.width * 0.7
                    height: MediaQuery.of(context).size.height * 0.6,
                    //height: 250.0,
                    width: MediaQuery.of(context).size.width * 0.459,
                    //width: 200,
                    decoration: BoxDecoration(
                        color: white,
                        boxShadow:[ BoxShadow(
                          color:Colors.blueGrey[50],
                          offset: Offset(14.0, 4.0),
                          blurRadius: 30.0,
                        )
                        ]
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset("images/${productlist[index].image}",height: 140.0,width: 140.0,),
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: customtext(text:productlist[index].name,weight: FontWeight.bold,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:12.0,top:8.0,bottom: 8.0,right: 20.0),
                              child: Text(productlist[index].amount,style: TextStyle(backgroundColor: Colors.black87,color: Colors.white),),
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
                                  child: customtext(text:productlist[index].ratings.toString(),size: 14,),
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
                                      child: productlist[index].wishlist ? Icon(
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
                              child: customtext(text: "Ksh. ${productlist[index].price}",weight: FontWeight.bold,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:Text( "Ksh. ${productlist[index].old_price}",style: TextStyle(decoration:TextDecoration.lineThrough),),
                            ),
                            /*new Text(productlist[index].brand,
                            style: TextStyle(
                              fontSize: 18.0,
                            ),),*/

                          ],
                        ),

                      ],
                    ),
                  ),
                )
            );

          },
        ),
      ),
    );

  }
}
