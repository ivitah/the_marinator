/*import 'package:flutter/material.dart';
import 'package:themarinator/widget/product_details.dart';

import 'package:themarinator/widget/title.dart';
import 'package:themarinator/widget/commons.dart';
import 'package:themarinator/widget/categories.dart';
import 'package:themarinator/models/products.dart';

class pop extends StatefulWidget {
  @override
  _popState createState() => _popState();
}

class _popState extends State<pop> {

  var poplist=[{
  "name":"8pm",
  "picture":"images/8pm.jpg",
  "old_price":950,
  "price":780,
  "amount":"750ml",
  "ratings":"4.2",
  "wishlist":"true",
  "brand":"y",
  "details":"blaaaaaaaablaaaaaaaaaahhblaaaaaaaaaaaah"
},];

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
          height:280.0,
            child: ListView.builder(
                 scrollDirection: Axis.horizontal,

         itemCount:poplist.length,
          itemBuilder: (BuildContext context,int index){
              return  Padding(
               padding: const EdgeInsets.all(8.0),
                 child:pop_prod(
                   prod_name: poplist[index]['name'],
                   prod_picture: poplist[index]['picture'],
                   prod_price: poplist[index]['price'],
                   prod_old_price: poplist[index]['old_price'],
                   prod_amount: poplist[index]['amount'],
                   prod_ratings: poplist[index]['ratings'],
                   prod_wishlist: poplist[index]['wishlist'],
                   prod_details: poplist[index]['details'],
                   prod_brand: poplist[index]['brand'],
                 ),
              );
    },
    )));
  }
}

class pop_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;
  final prod_amount;
  final prod_ratings;
  final prod_wishlist;
  final prod_details;
  final prod_brand;


  pop_prod({this.prod_name, this.prod_picture, this.prod_old_price,this.prod_brand,
      this.prod_price, this.prod_amount, this.prod_ratings, this.prod_wishlist,
      this.prod_details});


  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>new product_details(
          product_detail_name: prod_name,
          product_detail_image: prod_picture,
          product_detail_price: prod_price,
          product_detail_old_price: prod_old_price,
          product_detail_amount: prod_amount,
          product_detail_brand: prod_brand,
          product_detail_ratings: prod_ratings,
          product_detail_wishlist: prod_wishlist,



        ))),

        child: Container(
          height: 250.0,
          width: 200,
          decoration: BoxDecoration(
              color: white,
              boxShadow:[ BoxShadow(
                color:Colors.blueGrey[200],
                offset: Offset(14.0, 4.0),
                blurRadius: 30.0,
              )
              ]
          ),
          child: Column(
            children: <Widget>[
              Image.asset("images/${prod_picture.toString()}",height: 140.0,width: 140.0,),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:Text(prod_name,style:TextStyle(fontWeight:FontWeight.bold),),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:12.0,top:8.0,bottom: 8.0,right: 20.0),
                    child: Text(prod_amount.toString(),style: TextStyle(backgroundColor: Colors.black87,color: Colors.white),),
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
                        child:Text(prod_ratings.toString(),style:TextStyle(fontSize: 14),),
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
                            child: prod_wishlist ? Icon(
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
                    child: Text("Ksh. ${prod_price.toString()}",style:TextStyle(fontWeight: FontWeight.bold,)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:Text( "Ksh. ${prod_old_price.toString()}",style: TextStyle(decoration:TextDecoration.lineThrough),),
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );

}*/

  
