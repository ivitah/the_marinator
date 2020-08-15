import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:themarinator/models/hometrial.dart';
import 'package:themarinator/widget/pop_1.dart';
import 'file:///C:/Users/User/AndroidStudioProjects/flutter_project/the_marinator/lib/pages/popular_products.dart';
import 'package:themarinator/widget/small_button.dart';

//my imports
import 'package:themarinator/widget/title.dart';
import 'package:themarinator/widget/featured.dart';
import 'package:themarinator/widget/commons.dart';
import 'package:themarinator/widget/categories.dart';
import 'package:themarinator/models/products.dart';

List<products>productlist=[
  products(name:"8pm",ratings: 4.2,price: 730,old_price: 950,amount: "750ml",wishlist:true,image: "8pm.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
  products(name:"Glenfiddich",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "glenfiddich.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
  products(name:"Grants",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "grants.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
  products(name:"Hunters",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "hunters.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
  products(name:"William",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "william.jpg",brand:"kingstone",details: "The most celebrated brandy yeah",availability: true),
];



/*class cart extends StatefulWidget {
  @override
  _cartState createState() => _cartState();
}

class _cartState extends State<cart> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
         // iconTheme:color:Colors.black,
          elevation: 0.1,
          centerTitle: true,
          backgroundColor: Colors.grey,

          title: new Text("My Drinks",
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
            Navigator.push(context,MaterialPageRoute(builder:(context)=>new TrialHome()));

          }),
      ],
          bottom: TabBar(tabs: <Widget>[
             Tab(text: "My cart"),
             Tab(text: "Checkout"),
          ],
          ),
        ),
        body: SafeArea(child:ListView(
            children: <Widget>[
              Card(
              child:ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                itemCount:productlist.length,
                itemBuilder:  (_, index){
        return Container(
          height: 100.0,
      child: cart_items(

        cart_image: productlist[index].image,
        cart_name: productlist[index].name,
        cart_price: productlist[index].price,
        cart_old_price: productlist[index].old_price,
        cart_amount: productlist[index].amount,
        cart_wishlist: productlist[index].wishlist,
                  ),
                 );
                }
              ),
              ),

        ],),),
        /*Card()
        new Container(
          height: 350.0,
          child: cart_items(),
        ),*/

        bottomNavigationBar:new Container(
          child:Row(
            children: <Widget>[

              Expanded(child:ListTile(
                title: new Text("Total:",style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),),
                subtitle:new Text("Ksh.${200}",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),) ,

              ), ),
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
            ],
          ),
        ),
              )



    );
  }
}*/
class cart_items extends StatelessWidget {
  final cart_name;
  final cart_image;
  final cart_price;
  final cart_old_price;
  final cart_amount;
  final cart_quantity;
  final cart_wishlist;
  final cart_availability;


  cart_items({this.cart_name, this.cart_image, this.cart_price,
    this.cart_old_price, this.cart_amount, this.cart_quantity,
    this.cart_wishlist,
    this.cart_availability,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new ListTile(
          leading: new Image.asset("images/${cart_image}",
            ),
          title: Row(
            children: <Widget>[
              Expanded(
                child: new Text(cart_name),
              ),
              Expanded(
                  child: new Text(cart_amount,
    style: TextStyle(backgroundColor: Colors.black87,color: Colors.white),),),
            ],
          ),
          subtitle: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child:new Text("Ksh. ${cart_price}",
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0
                        ),),),
                  Expanded(
                    child: new Text(
                      "Ksh. ${cart_old_price}",
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontSize: 20.0,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          trailing: FittedBox(
            fit: BoxFit.fill,
            child: Column(
              children: <Widget>[
                IconButton(icon: Icon(Icons.arrow_drop_up,color: Colors.red),iconSize: 38, onPressed: () {}),
                Text('$cart_quantity',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                IconButton(icon: Icon(Icons.arrow_drop_down,color: Colors.red,),iconSize: 38, onPressed: () {}),
              ],
            ),
          ),

        ),
      ],
    );
  }
}


