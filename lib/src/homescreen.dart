import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:themarinator/bottombar/categories.dart';

//my imppooooorrrrrrrrtttttttttssssssssssss
import 'file:///C:/Users/User/AndroidStudioProjects/flutter_project/the_marinator/lib/bottombar/home.dart';
import 'package:themarinator/bottombar/myaccount.dart';
import 'package:themarinator/pages/final_cart.dart';
import 'package:themarinator/sha/services/auth.dart';
import 'package:themarinator/sha/services/provider.dart';

class homescreen extends StatefulWidget {
  @override
  _homescreenState createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  int currentTabIndex = 0;
  List<Widget>pages;
  Widget currentPage;
  home homePage;
  categories categoriesPage;

  finalCart ordersPage;
  myaccountPage myaccount;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homePage=home();
    categoriesPage=categories();
    ordersPage= finalCart();
    myaccount=myaccountPage();
    pages=[homePage,myaccount,categoriesPage,ordersPage];
    currentPage=homePage;


  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      auth:authService(),
      db:Firestore.instance,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentTabIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (int index){
            setState(() {
              currentTabIndex=index;
              currentPage=pages[index];
            });
          },
          items:<BottomNavigationBarItem>[

            BottomNavigationBarItem(
              icon:Icon(Icons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.person),
              title:Text("My Account"),
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.view_list),
              title:Text("Categories"),
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.local_bar),
              title:Text("My Orders"),

            ),
          ],
        ),
        body: currentPage,
      ),
    );
  }
}
