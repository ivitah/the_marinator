import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:themarinator/pages/carttrial.dart';
import 'package:themarinator/pages/spirits.dart';
import 'file:///C:/Users/User/AndroidStudioProjects/flutter_project/the_marinator/lib/pages/popular_products.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:themarinator/sha/services/auth.dart';
import 'package:themarinator/sha/services/provider.dart';

//my imports
import 'package:themarinator/widget/title.dart';
import 'package:themarinator/widget/featured.dart';
import 'package:themarinator/widget/commons.dart';
import 'package:themarinator/widget/categories.dart';


class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  @override
  Widget build(BuildContext context) {
    Widget image_courasel = new Container(
      height:MediaQuery.of(context).size.height*0.25,
     // height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/a4.jpg'),
          AssetImage('images/a5.jpg'),
          AssetImage('images/a6.jpg'),
          AssetImage('images/a9.jpg'),
          AssetImage('images/a2.jpg'),
          AssetImage('images/a7.jpg'),
        ],
        autoplay: true,
        //animationCurve: Curves.fastOutSlowIn,
        //animationDuration: Duration(milliseconds: 2500),
        dotSize: 4.0,
        indicatorBgPadding: 8.0,
        dotBgColor: Colors.transparent,
      ),
    );
    return Scaffold(
      backgroundColor:white,
      //begins here

      body:SafeArea(
        child:ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(padding:EdgeInsets.all(8.0),
                  child:customtext(
                      text:"Drinking tonight?",
                      size: 18),),

              Stack(
                children: <Widget>[
                  IconButton(icon:Icon(Icons.shopping_cart,color:black,), onPressed:(){
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
                        child: Text("2",style: TextStyle(fontSize: 8.5,color: white),),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 4.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: white,
                boxShadow:[ BoxShadow(
                    color:grey,
                  offset: Offset(1.0, 1.0),
                  blurRadius: 4.0,

                )
                ]

              ),
              child: ListTile(
                leading: Icon(Icons.search,color: red,),
                title: TextField(
                  decoration: InputDecoration(
                    hintText: "Search for drinks here",
                    border:InputBorder.none,
                  ),
                ),

                trailing: Icon(Icons.filter_list,color: red,),
              ),
            ),
          ),
          SizedBox(height: 4.0,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical :8.0),
            child: image_courasel,
          ),
          categories(),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: customtext(text:"Popular drinks this week",size: 20,),
                ),
                RaisedButton(onPressed:(){
                  Navigator.push(context,MaterialPageRoute(builder:(context)=>new spirits()));

                },
                  child: new Text("view all..."),
                  color: white,
                ),
              ],
            ),
          ),

          popular_prod(),





          //==featured list begins here================================================
         /* Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image.asset("images/captain.jpg")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    small_button(Icons.favorite),
                    /*Padding(padding: EdgeInsets.only(right:8.0),
                      child:  Container(
                        width: 50.0,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(

                          children: <Widget>[
                            Padding(padding:EdgeInsets.only(left: 6.0),
                              child: Icon(Icons.star,color: Colors.yellow[900],size: 20,),
                            ),
                            customtext(text: "4.5"),
                          ],
                        ),
                      ),
                    ),*/
                  ],
                ),
              ),
              Positioned(
                top:20.0,
                left: 160,
                child:Padding(padding: EdgeInsets.all(1.0),
                  child:  Container(
                    width: 60.0,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(

                      children: <Widget>[
                        Padding(padding:EdgeInsets.all( 6.0),
                          child: Icon(Icons.star,color: Colors.yellow[900],size: 20,),
                        ),
                        customtext(text: "4.5"),
                      ],
                    ),
                  ),
                ),

              ),
            ],
            overflow: Overflow.visible,
          ),*/
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: customtext(text:"Spirits",size: 20,),
                ),
                RaisedButton(onPressed:(){
                  Navigator.push(context,MaterialPageRoute(builder:(context)=>new spirits()));

                },
                  child: new Text("view all..."),
                  color: white,
                ),
              ],
            ),
          ),

          featured(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: customtext(text:"Wines",size: 20,),
                ),
                RaisedButton(onPressed:(){},
                  child: new Text("view all..."),
                  color: white,
                ),
              ],
            ),
          ),

          featured(),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: customtext(text:"Cider",size: 20,),
                ),
                RaisedButton(onPressed:(){},
                  child: new Text("view all..."),
                  color: white,
                ),
              ],
            ),
          ),

          featured(),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: customtext(text:"Beers",size: 20,),
                ),
                RaisedButton(onPressed:(){},
                  child: new Text("view all..."),
                  color: white,
                ),
              ],
            ),
          ),

          featured(),

        ],
          ),
      ),

      //==================bottom bars=================

      /* bottomNavigationBar: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(icon:Icon(Icons.home,color:Colors.blue,), onPressed: null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(icon:Icon(Icons.monetization_on,color:grey,), onPressed: null),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(icon:Icon(Icons.account_balance,color: red,), onPressed: null),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(icon:Icon(Icons.local_bar,color:black,), onPressed: null),
                  ),
                ],
              ),
          ),*/
      resizeToAvoidBottomPadding: false,
        );
  }
}
