
import 'package:flutter/material.dart';
import 'package:themarinator/pages/carttrial.dart';
import 'package:themarinator/pages/cspirits.dart';
import 'package:themarinator/pages/spirits.dart';
import 'package:themarinator/widget/commons.dart';


class categories extends StatefulWidget {
  @override
  _categoriesState createState() => _categoriesState();
}

class _categoriesState extends State<categories>  with SingleTickerProviderStateMixin{
  TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController=TabController(length:6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //========================appbar==========================
      appBar: AppBar(
        elevation: 0.1,
        centerTitle: true,
        backgroundColor: Colors.white,

        title: new Text("Categories",
          style: TextStyle(
            fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        actions: <Widget>[

          Stack(
            children: <Widget>[
              IconButton(icon: Icon(Icons.shopping_cart, color:black,),
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
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),

            child: Container(
              width:MediaQuery.of(context).size.width,
              height: 50.0,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(color: grey,width: 0.5)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                child: Row(
                  children: <Widget>[
//                  TextField(
//                    decoration: InputDecoration(
//                      hintText: "Search for drinks here",
//                      border:InputBorder.none,
//                    ),
//                  ),

                  Text("Search here",style: TextStyle(
                    color: grey,
                    fontSize: 18.0,
                  ),),
                  Spacer(),
                    Icon(Icons.search,color: red,),
                  ],
                ),
              ),
            ),
          ),
          TabBar(
            controller: tabController,
            indicatorColor: Colors.redAccent,
               indicatorWeight: 3.0,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              tabs:<Widget>[
                Tab(
                  child: Text("Spirits",
                  style: TextStyle(
                    fontSize:20.0,
                    fontFamily: 'OpenSans'
                  ),),
                ),
                Tab(
                  child: Text("Beer",
                    style: TextStyle(
                        fontSize:20.0,
                        fontFamily: 'OpenSans'
                    ),),
                ),
                Tab(
                  child: Text("Wines",
                    style: TextStyle(
                        fontSize:20.0,
                        fontFamily: 'OpenSans'
                    ),),
                ),
                Tab(
                  child: Text("Ciders",
                    style: TextStyle(
                        fontSize:20.0,
                        fontFamily: 'OpenSans'
                    ),),
                ),
                Tab(
                  child: Text("Soda",
                    style: TextStyle(
                        fontSize:20.0,
                        fontFamily: 'OpenSans'
                    ),),
                ),
                Tab(
                  child: Text("Juice",
                    style: TextStyle(
                        fontSize:20.0,
                        fontFamily: 'OpenSans'
                    ),),
                ),
              ]),
          Expanded(
            child: Container(
              child: TabBarView(
                controller: tabController,
                children: <Widget>[
                  cspirits(),
                  cspirits(),
                  cspirits(),
                  cspirits(),
                  cspirits(),
                  cspirits(),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
