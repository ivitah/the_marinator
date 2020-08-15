import 'package:flutter/material.dart';
import 'package:themarinator/pages/popular_products.dart';
import 'package:themarinator/pages/signin.dart';
import 'package:themarinator/pages/signup.dart';

/*List<products>productlist=[
  products(name:"8pm",ratings: 4.2,price: 730,old_price: 950,amount: "750ml",wishlist:true,image: "8pm.jpg",brand:"kingstone",details: "The most celebrated brandy yeah"),
  products(name:"Glenfiddich",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "glenfiddich.jpg",brand:"kingstone",details: "The most celebrated brandy yeah"),
  products(name:"Grants",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "grants.jpg",brand:"kingstone",details: "The most celebrated brandy yeah"),
  products(name:"Hunters",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "hunters.jpg",brand:"kingstone",details: "The most celebrated brandy yeah"),
  products(name:"William",ratings: 4.2,price: 830,old_price: 1050,amount: "750ml",wishlist:true,image: "william.jpg",brand:"kingstone",details: "The most celebrated brandy yeah"),
];*/


class TrialHome extends StatefulWidget {
  @override
  _TrialHomeState createState() => _TrialHomeState();
}

class _TrialHomeState extends State<TrialHome> {
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
                    /* Stack(
                      children: <Widget>[
                        Container(
                          height: 150.0,
                           color: Colors.redAccent,
                        ),
                        Column(
                          children: <Widget>[
                            SizedBox(width: 15.0,),
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Padding(
                                 padding: const EdgeInsets.only(top: 20.0,left: 10.0),
                                 child: Text("Head of Marinators,",style:TextStyle(
                                   fontSize:  30.0,
                                   fontFamily: 'Quicksand',
                                   fontWeight: FontWeight.bold
                                 ),),
                               ),
                             ),
                            SizedBox(width: 15.0,),

                            Padding(
                              padding: const EdgeInsets.only(top: 20.0,left: 20.0),
                              child: Text("What would you like to buy?",style:TextStyle(
                                  fontSize:  23.0,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold
                              ),),
                            ),

                          ],
                        ),
                      ],
                    ),*/
                    /*Stack(
                      children: <Widget>[
                        SizedBox(width: 15.0,),
                        Material(
                          elevation: 10.0,
                          child: Container(
                            height: 75.0,
                            color: Colors.white,
                          ),
                        ),
                    ],),*/

                    itemCard('8pm','images/8pm.jpg',780,1260,'750ml',2),

                    itemCard('8pm','images/8pm.jpg',780,1260,'750ml',2),
                    itemCard('8pm','images/8pm.jpg',780,1260,'750ml',2),
                    itemCard('8pm','images/8pm.jpg',780,1260,'750ml',2)
                    ,Divider(),
                    itemCard('8pm','images/8pm.jpg',780,1260,'750ml',2),
                    Divider(),
                    itemCard('8pm','images/8pm.jpg',780,1260,'750ml',2),
                    Divider(),


//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        Padding(
//                          padding: const EdgeInsets.all(8.0),
//                          child: Text("Total",style: TextStyle(fontSize: 23.0,
//                            color: Colors.grey,
//                            //fontWeight: FontWeight.bold,
//                          ),),
//                        ),
//                        Text("Ksh.${2290}",style: TextStyle(fontSize: 23.0,
//                            fontWeight: FontWeight.bold,
//                            color: Colors.black87
//                          ),
//                        ),
//
//                      ],
//                    ),
//                    SizedBox(height: 18.0,),
//
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        Padding(
//                          padding: const EdgeInsets.all(8.0),
//                          child: Text("Delivery charges",style: TextStyle(fontSize: 17.0,
//                            color: Colors.grey,
//                          ),),
//                        ),
//                        Text("Ksh.${2240}",style: TextStyle(fontSize:17.0,
//                            color: Colors.black87
//                        ),),
//
//                      ],
//                    ),
//                    Divider(),
//
//                    SizedBox(height: 18.0,),
//
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        Padding(
//                          padding: const EdgeInsets.all(8.0),
//                          child: Text("SubTotal",style: TextStyle(fontSize: 20.0,
//                            color: Colors.grey,
//
//                            //fontWeight: FontWeight.bold,
//                          ),),
//                        ),
//                        Text("Ksh.${2240}",style: TextStyle(fontSize: 20.0,
//                          fontWeight: FontWeight.bold,
//                        ),),
//
//                      ],
//                    ),
                  ],
                ),
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
                Text("Ksh.${2240}",style: TextStyle(fontSize:17.0,
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

                /*MaterialButton(onPressed: (){},
                  minWidth:double.infinity ,
                  color: Colors.red,
                  height:60.0 ,
                  child: Text("PROCEED TO CHECKOUT",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                    ),),
                ),*/

              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar:new Container(
        //height:230.0,
        height: 50.0,
        child:Column(

          children: <Widget>[

            /*Row(
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
                Text("Ksh.${2240}",style: TextStyle(fontSize:17.0,
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
            SizedBox(height: 15.0,),*/
            InkWell(
            onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>new signin())),

      child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50.0,
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(30.0)
                ),
                child: Center(
                  child: Text("Proceed To CheckOut",style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19.0,
                  ),),
                ),
              ),
            ),
          ],
        ),
        /* Row(
          children: <Widget>[
            Expanded(
              child:ListTile(
                title: new Text("Total:",style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold
                ),),
                subtitle:new Text("Ksh.${1200}",
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),) ,

              ), ),
            Expanded(
              flex:2,
              child:MaterialButton(onPressed: (){},
                color: Colors.blueAccent,

                textColor: Colors.white,
                elevation: 0.5,
                child:Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: new Text("Proceed to checklist",
                    style: TextStyle(
                      fontSize: 23.0,),),
                ),
              ),
            ),
          ],
        ),*/
      ),
    );
  }
  Widget itemCard(String title,String imgpath,double price,double old_price,String amount,int quantity){
    return  Material(
      elevation:10.0,

      //color: Colors.white70,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [ BoxShadow(
              color: Colors.blueGrey[50],
              offset: Offset(14.0, 4.0),
              blurRadius:5.0,
            ),],),
          height: 210.0,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 120.0,
                    height: 140.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:AssetImage(imgpath),

                      ),
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                fontFamily: 'Quicksand'
                            ),),
                          SizedBox(width: 50.0,),
                          Text(amount,style: TextStyle(backgroundColor: Colors.black87,color: Colors.white,fontSize: 18.0),),

                        ],
                      ),
                      SizedBox(height:10.0,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left:10.0),
                            child: Text("Ksh.${price}",style: TextStyle(fontSize:20.0,fontWeight: FontWeight.bold,color: Colors.red),),
                          ),
                          SizedBox(width:30.0,),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:Text("Ksh.${old_price}",style: TextStyle(decoration:TextDecoration.lineThrough,color: Colors.grey,fontSize:18.0),),
                          ),
                        ],
                      ),
                      SizedBox(height:10.0,),
                    ],
                  ),
                ],
              ),
              Divider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 13.0,
                    height: 13.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius:BorderRadius.circular(2.0),
                    ),
                    child:Icon(Icons.remove,color: Colors.black,size: 13.0,),
                    //onPressed: (){}),
                  ),
                  SizedBox(width: 8.0,),

                  Text("${quantity}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20.0,),),
                  SizedBox(width: 8.0,),

                  Container(
                    width: 13.0,
                    height: 13.0,
                    decoration: BoxDecoration(
                      color: Colors.blue[300],
                      borderRadius:BorderRadius.circular(2.0),
                    ),
                    child:Icon(Icons.add,color: Colors.black,size: 13.0,),
                    //onPressed: (){}),
                  ),

                  SizedBox(width:12.0,),



                  FlatButton(
                    onPressed: (){},
                    child: Text("Remove",style: TextStyle(color: Colors.red,fontSize: 20.0,fontWeight: FontWeight.bold),),
                    color: Colors.grey[50],
                  ),
                  //IconButton(icon:Icon(Icons.delete), onPressed:(){},


                ],
              ),

            ],
          ),
        ),
      ),
    );


  }
}
