import 'package:flutter/material.dart';
import 'package:themarinator/models/products.dart';
import 'package:themarinator/pages/popular_products.dart';
import 'package:themarinator/pages/product_details.dart';
import 'package:themarinator/pages/signin.dart';
import 'package:themarinator/widget/commons.dart';
import 'package:themarinator/widget/title.dart';

List<products>productlist=[
  products(name:"8pm",ratings: 4.2,price: 730,old_price: 950,amount: "750ml",wishlist:true,image: "8pm.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
  products(name:"Glenfiddich",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "glenfiddich.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability:false),
  products(name:"Grants",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "grants.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
  products(name:"Hunters",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "hunters.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
  products(name:"William",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "william.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
];



class TialHome extends StatefulWidget {
  final icart_name;
  final icart_image;
  final icart_price;
  final icart_old_price;
  final icart_amount;
  final icart_quantity;
  final icart_wishlist;
  final icart_availability;
  final icart_ratings;
  final icart_i;
  final icart_details;
  final icart_brand;


  TialHome({this.icart_name,
    this.icart_image,
    this.icart_price,
    this.icart_old_price,
    this.icart_amount,
    this.icart_quantity,
    this.icart_availability,
    this.icart_wishlist,
    this.icart_ratings,
    this.icart_i,
    this.icart_details,
    this.icart_brand,
  }
      );
  @override
  _TialHomeState createState() => _TialHomeState();
}

class _TialHomeState extends State<TialHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,

        centerTitle: true,
        backgroundColor: Colors.grey,
        title:Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("My Drinking Cart",style: TextStyle(fontSize: 23.0,color: Colors.black),
          ),
        ),),
      //  iconTheme: Colors.,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    Divider(),

                    itemCart(
                      itcart_name: widget.icart_name,
                      itcart_image: widget.icart_image,
                      itcart_price: widget.icart_price,
                      itcart_old_price: widget.icart_old_price,
                      itcart_quantity: widget.icart_quantity,
                      itcart_amount: widget.icart_amount,
                      itcart_wishlist: widget.icart_wishlist,
                      itcart_availability: widget.icart_availability,
                      itcart_ratings: widget.icart_ratings,
                      itcart_details: widget.icart_details,
                      itcart_brand: widget.icart_brand,
                    ),
                    Divider(),
                    SizedBox(height: 20.0,),
                  ],
                ),
                Divider(),
              ],
            ),
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
                  ]),
            ),

          ],
        ),
      ),
      bottomNavigationBar:new Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),

        width: MediaQuery.of(context).size.width,
        child:Row(
          children: <Widget>[
            Expanded(
              flex:4,
              child:ListTile(
              title: new Text("Total:",style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold
              ),),
              subtitle:new Text("Ksh.${1200}",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize:19.0,
                ),) ,

            ), ),
            Expanded(
              flex:9,
              child:Container(
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
                  onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>new signin())),

                  child: Center(
                    child: Text("Proceed To CheckOut",style: TextStyle(
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
class itemCart extends StatefulWidget {
  final itcart_name;
  final itcart_image;
  final itcart_price;
  final itcart_old_price;
  final itcart_amount;
  final itcart_quantity;
  final itcart_availability;
  final itcart_ratings;
  final itcart_brand;
  final itcart_details;
  // itcart_i;

  itemCart({
    this.itcart_name,
    this.itcart_image,
    this.itcart_price,
    this.itcart_old_price,
    this.itcart_amount,
    this.itcart_quantity,
    this.itcart_wishlist,
    this.itcart_availability,
    this.itcart_ratings,
    this.itcart_brand,
    this.itcart_details,
    //this.itcart_i,
}
      );

  final itcart_wishlist;

  @override
  _itemCartState createState() => _itemCartState();
}

class _itemCartState extends State<itemCart> {

  List picked=[false,false];
  var i;
   int total = 0;
   pickToggle(index){
     setState((){
       picked[index]=!picked[index];
       getTotal();
     });
   }
getTotal(){}

  @override
  Widget build(BuildContext context) {
    return   /*InkWell(

    onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>new product_details (
      product_detail_image: itcart_image,
      product_detail_name: itcart_name,
      product_detail_amount: itcart_amount,
      product_detail_price: itcart_price,
      product_detail_old_price: itcart_old_price,
      product_detail_wishlist:itcart_wishlist,
      //product_detail_ratings: itcart_ratings,
     // product_detail_details: itcart_details,
      product_detail_availability:itcart_availability,

    ))),)*/
      Material(
        elevation:3.0,

        //color: Colors.white70,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [ BoxShadow(
                color: Colors.blueGrey[50],
                offset: Offset(14.0, 4.0),
                blurRadius: 5.0,
              ),],),

            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: InkWell(
                        onTap: (){},
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.029,
                         // height: 25.0,
                          width:MediaQuery.of(context).size.width * 0.05,
                          //width: 25.0,
                          decoration: BoxDecoration(
                            color:widget.itcart_availability?
                                Colors.grey.withOpacity(0.4)
                               :Colors.red.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(12.5),
                          ),
                          child:Center(
                            child: widget.itcart_availability?
                            Container(
                              height:MediaQuery.of(context).size.height * 0.0145,
                              width:MediaQuery.of(context).size.width * 0.025,
                              decoration: BoxDecoration(
                                color:Colors.yellow,
                                  borderRadius: BorderRadius.circular(6.0),
                              ),
                            ):Container(),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new product_details(

                                product_detail_image: widget.itcart_image,

                                product_detail_name:widget.itcart_name,

                                product_detail_amount: widget.itcart_amount,

                                product_detail_price: widget.itcart_price,

                                product_detail_old_price: widget.itcart_old_price,

                                product_detail_wishlist: widget.itcart_wishlist,

                               // product_detail_brand: widget.itcart_brand,
                                product_detail_brand: widget.itcart_brand !=null?widget.itcart_brand :'',

                                product_detail_ratings: widget.itcart_ratings,

                               product_detail_details: widget.itcart_details!=null?widget.itcart_details:'',

                               product_detail_availability: widget.itcart_availability,

                              ),),

                          ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          width:MediaQuery.of(context).size.width * 0.25,
                         // width: 100.0,
                          height: MediaQuery.of(context).size.height * 0.17,
                         // height: 120.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:AssetImage("images/${widget.itcart_image}"),

                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.004,),
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(widget.itcart_name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    fontFamily: 'Quicksand'
                                ),),
                            ),
                            SizedBox(width:MediaQuery.of(context).size.width * 0.08,),
                            Text(widget.itcart_amount,style: TextStyle(backgroundColor: Colors.black87,color: Colors.white,fontSize: 16.0),),

                          ],
                        ),
                        SizedBox(height:MediaQuery.of(context).size.height * 0.002,),

                        widget.itcart_availability?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left:10.0),
                              child: Text("Ksh.${widget.itcart_price}",style: TextStyle(fontSize:18.0,fontWeight: FontWeight.bold,color: Colors.red),),
                            ),
                            SizedBox(width:MediaQuery.of(context).size.width * 0.005,),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:Text("Ksh.${widget.itcart_old_price}",style: TextStyle(decoration:TextDecoration.lineThrough,color: Colors.grey,fontSize:16.0),),
                            ),
                          ],
                        ):OutlineButton(onPressed:(){},
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
                        SizedBox(height:MediaQuery.of(context).size.height * 0.0005,),
                        widget.itcart_availability?
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left:8.0,right: 8.0),
                              child: customtext(text:'${widget.itcart_ratings}',size: 14,),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.002,),
                            Icon(Icons.star,color: red,size: 16,),
                            Icon(Icons.star,color: red,size: 16,),
                            Icon(Icons.star,color: red,size: 16,),
                            Icon(Icons.star,color: red,size: 16,),
                            Icon(Icons.star,color:grey,size: 16,),

                            SizedBox(width:MediaQuery.of(context).size.width* 0.08,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:BorderRadius.circular(20.0),
                                    color: white,
//                                    boxShadow:[ BoxShadow(
//                                      color:Colors.grey[300],
//                                      offset: Offset(1.0, 1.0),
//                                      blurRadius: 4.0,
//                                    )
//                                    ]
                                ),


                                child: Padding(padding: EdgeInsets.all(4.0),
                                  child:Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:widget.itcart_wishlist ? Icon(
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

                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: new Text(widget.itcart_details,
                                style: TextStyle(
                                  fontSize: 0.0,
                                ),),
                            ),


                          ],
                        ):Row()


                      ],
                    ),
                  ],
                ),
                Divider(height: MediaQuery.of(context).size.height*0.00000005,),
                widget.itcart_availability?

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                     // width: MediaQuery.of(context).size.width* 0.008,
                     width: 15.0,
                     // height: MediaQuery.of(context).size.height * 0.008,
                     height: 15.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius:BorderRadius.circular(8.0),
                      ),
                      child:Icon(Icons.remove,color: Colors.black,size: 15.0,),
                      //onPressed: (){}),
                    ),
                    SizedBox(width:MediaQuery.of(context).size.width * 0.006,),

                    Text("${widget.itcart_quantity}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18.0,),),
                    SizedBox(width: 8.0,),

                    Container(
                      //width: MediaQuery.of(context).size.width * 0.008,
                      width: 15.0,
                      //height: MediaQuery.of(context).size.height * 0.008,
                      height: 15.0,
                      decoration: BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius:BorderRadius.circular(8.0),
                      ),
                      child:Icon(Icons.add,color: Colors.black,size: 15.0,),
                      //onPressed: (){}),
                    ),

                    SizedBox(width:MediaQuery.of(context).size.width * 0.007,),



                    FlatButton(
                      onPressed: (){},
                      child: Text("Remove",style: TextStyle(color: Colors.red,fontSize: 18.0,fontWeight: FontWeight.bold),),
                      color: Colors.grey[50],
                    ),
                    //IconButton(icon:Icon(Icons.delete), onPressed:(){},


                  ],
                ):Row()

              ],
            ),
          ),
        ),
      );

  }
  Widget itemCart(i,price){}
}

class Recent_single_prod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(

      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:productlist.length,
          itemBuilder: (_, index) {
            return Hero(tag: productlist[index].name, child: Material(
              child: InkWell(
                //so now we creating a thingie such that when we tap it takes us to da next levelll

                onTap: () =>
                    Navigator.of(context).push(
                        new MaterialPageRoute(builder: (context) =>new product_details(
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
                    height: 300.0,
                    width: 250,
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
                      height: 300.0,
                      width: 230,
                      decoration: BoxDecoration(
                          color: white,
                          boxShadow: [ BoxShadow(
                            color: Colors.red[200],
                            offset: Offset(14.0, 4.0),
                            blurRadius: 30.0,
                          )
                          ]
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset("images/${productlist[index].image}",
                            height: 230.0, width: 200.0,),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: customtext(text: productlist[index].name,
                                  weight: FontWeight.bold,),
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


