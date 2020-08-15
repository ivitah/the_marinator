import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themarinator/models/categories.dart';
//my imports

import 'package:themarinator/widget/commons.dart';
import 'package:themarinator/widget/title.dart';

List <category> categorieslist =[
  category(name:"Beer" , image:"b1.jpg"),
  category(name:"Wine" , image:"b2.png"),
  category(name:"Spirits", image:"b9.jpg"),
  category(name:"Cider", image:"b8.jpg"),
  category(name:"Soda" , image:"b4.png"),
  category(name:"Juice" , image:"b6.jpg"),
  category(name:"Water" , image:"b3.jpg"),
];

class categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      child:ListView.builder(
          scrollDirection:Axis.horizontal,
          itemCount: categorieslist.length,
          itemBuilder: (_, index){
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(onTap: (){},
              child: FittedBox(
                child: Material(
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: white,
                          boxShadow:[ BoxShadow(
                            color:Colors.red[50],
                            offset: Offset(12.0, 12.0),
                            blurRadius:40.0,
                          ),
                          ],
                        ),
                        child:Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset("images/${categorieslist[index].image}",fit: BoxFit.fill,
                          height: 75.0,
                           width: 90.0,
                          ),
                        ),
                        width:100.0,
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            child:customtext(text:categorieslist[index].name,size: 15,)
                        ),
                      ),
                     // customtext(text:categorieslist[index].name,size: 10,)
                    ],
                  ),
                ),
              ),
            ),
            /*child: Column(
              children: <Widget>[
               Container(
                  decoration: BoxDecoration(
                    color: white,
                    boxShadow:[ BoxShadow(
                      color:Colors.red[50],
                      offset: Offset(1.0, 1.0),
                      blurRadius: 4.0,
                    ),
                    ],
                  ),
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("images/${categorieslist[index].image}"),
                  ),
                  width: 60.0,
                ),
                SizedBox(
                  height: 4.0,
                ),
                customtext(text:categorieslist[index].name,size: 16,)
              ],
            ),*/
          );
        },
      ),

    );
  }
}
