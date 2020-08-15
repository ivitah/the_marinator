//import 'dart:html';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:themarinator/sha/services/provider.dart';
import 'package:themarinator/pages/edit_profile.dart';
import 'package:themarinator/widget/commons.dart';
import 'package:themarinator/widget/customdialogue.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:themarinator/models/users.dart';



enum AuthFormType { signIn, signUp, reset, anonymous }

class myaccountPage extends StatefulWidget {
  final AuthFormType authFormType;

  myaccountPage({Key key, @required this.authFormType}) : super(key: key);

  @override
  _myaccountPageState createState() =>
      _myaccountPageState(authFormType: this.authFormType);
}

class _myaccountPageState extends State<myaccountPage> {
  //final User user=User(admin: false);

  final newUser=  new User(displayName:'hu',mpesaNumber:'',location:'',username:'',email:'',photoUrl:'',addressDelivery:'',password:'',
      admin:false,
  );
  bool turnOnNotification = false;
  bool turnOnLocation = false;
  AuthFormType authFormType;
  bool _isAdmin=false;

  _myaccountPageState({this.authFormType});


  @override
  Widget build(BuildContext context) {
    final auth = Provider.of(context).auth;
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;


    return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 50.0,
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AutoSizeText("Profile", style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: _height * 0.025,),
                  FutureBuilder(
                    future: Provider.of(context).auth.getCurrentUser(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                       // _isAdmin=user.admin ??false;

                      //return Text("whaaaaaaaaaat");
                        return displayUserInformation(context, snapshot);
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );


  }


  Widget displayUserInformation(context, snapshot) {
    final user = snapshot.data;
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                // color: Colors.red,
                  borderRadius: BorderRadius.circular(60.0),
                  boxShadow: [BoxShadow(
                    blurRadius: 3.0,
                    offset: Offset(0, 4.0),
                    color: Colors.black38,
                  )
                  ],
                  image: DecorationImage(image: AssetImage("images/c6.jpg",),
                    // image:NetworkImage(image: AssetImage("images/c6.jpg",),................for network ofcourse
                    fit: BoxFit.cover,
                  )
              ),
              //child: Image.asset("images/c6.jpg"),
            ),
            SizedBox(width: _width * 0.0325,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[

                  AutoSizeText("${user.displayName ?? 'Anonymous'}",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                    ),),
                  SizedBox(height: _height * 0.0125,),

                  AutoSizeText("${user.email ?? 'Anonymous'}", style: TextStyle(
                      color: Colors.grey
                  ),),
                  SizedBox(height: _height * 0.0125,),
//
                  showSignOut(context, user.isAnonymous),
                ],
              ),
            ),
          ],
        ),
        displayUserExtraInformation(context, user.isAnonymous),

       // adminfeature(),
      ],
    );
  }

  Stream<QuerySnapshot>getUsersProfileStreamSnapshot(BuildContext context) async*{
    final uid=   await Provider.of(context).auth.getCurrentUID();
    //the yield star returns the userProfile info present in firestore and enables changes continuosly to be made
    yield*Firestore.instance.collection("User").document(uid).collection("UserProfile").snapshots();
  }


  Widget displayUserExtraInformation(context, bool isAnonymous) {

    final _height = MediaQuery
        .of(context)
        .size
        .height;
    final _width = MediaQuery
        .of(context)
        .size
        .width;
    if (isAnonymous == true) {
      return Row();
    }
    else {
      return StreamBuilder(
        stream:getUsersProfileStreamSnapshot(context),
       // stream:getUsersProfileStreamSnapshot(BuildContext context,DocumentSnapshot UserProfile),
        builder: (context, snapshot) {
          if(snapshot.data == null) return SpinKitChasingDots(color: Colors.blue,);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: _height * 0.0325,),
              AutoSizeText("Account", style: TextStyle(
                fontSize: 22.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
             // itemCount: 4,
              itemCount: snapshot.data.documents.length??"4",
                itemBuilder:(BuildContext context,int index)=>UserProfileDetails(context,snapshot.data.documents[index],),
            ),

              editProfileButton(),

              SizedBox(height: _height * 0.0325,),
              AutoSizeText("Notifications", style: TextStyle(
                fontSize: 22.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),),

              Card(
                elevation: 3.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      children: <Widget>[

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              AutoSizeText("App notifications", style: TextStyle(
                                  fontSize: 17)),
                              Switch(value: turnOnNotification,
                                onChanged: (bool value) {
                                  setState(() {
                                    turnOnNotification = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),

                        Divider(
                          height: 10.0,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              AutoSizeText("Location Tracking", style: TextStyle(
                                  fontSize: 17)),
                              Switch(value: turnOnLocation,
                                onChanged: (bool value) {
                                  setState(() {
                                    turnOnLocation = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 10.0,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: _height * 0.0325,),
              AutoSizeText("Other", style: TextStyle(
                fontSize: 22.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: _height * 0.0325,),
              Card(
                elevation: 3.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      children: <Widget>[

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              AutoSizeText("Language", style: TextStyle(
                                  fontSize: 17)),
                              Switch(value: turnOnNotification,
                                onChanged: (bool value) {
                                  setState(() {
                                    turnOnNotification = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),

                        Divider(
                          height: 10.0,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    CustomDialog(
                                      title: "Are you sure you want to log out?",
                                      description:
                                      "With an account, your data will be securely saved, allowing you to access it from multiple devices.",
                                      primaryButtonText: "Create My Account",
                                      primaryButtonRoute: "/signUp",
                                      secondaryButtonText: "Maybe Later",
                                      secondaryButtonRoute: "/anonymousSignIn",
                                    ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          CustomDialog(
                                            title: "Are you sure you want to log out?",
                                            description:
                                            "",
                                            primaryButtonText: "No",
                                            primaryButtonRoute: "/signUp",
                                            secondaryButtonText: "Yes",
                                            secondaryButtonRoute: "/anonymousSignIn",
                                          ),
                                    );
                                  },
                                  child: AutoSizeText(
                                    "Log out", style: TextStyle(fontSize: 17),),
                                  //child: showSignOut(context,  snapshot.data.isAnonymous),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 10.0,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        }
      );
    }
  }


  Widget showSignOut(context, bool isAnonymous) {
    final _width = MediaQuery
        .of(context)
        .size
        .width;
    final _height = MediaQuery
        .of(context)
        .size
        .height;
    if (isAnonymous == true) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 40.0,
          width: _width * 0.4,
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.blue
            ),
            //borderRadius: BorderRadius.circular(20.0)
          ),
          child: Center(
            child: RaisedButton(
              child: AutoSizeText("Sign In To Save Your Data", style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue
              ),),
              onPressed: () {
                Navigator.of(context).pushNamed('/convertUser');
              },
              color: white,
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 40.0,
          width: _width * 0.4,
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.blue
            ),
          ),
          child: Center(
            child: RaisedButton(
              child: AutoSizeText("Log Out", style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue
              ),),
              onPressed: () async {
                try {
                  await Provider
                      .of(context)
                      .auth
                      .signOut();
                } catch (e) {
                  print(e);
                }
              },
            ),
          ),
        ),
      );
    }
  }

 Widget UserProfileDetails(BuildContext context,DocumentSnapshot UserProfile){
   _isAdmin = UserProfile [ "admin"]??false;
   final _height = MediaQuery
       .of(context)
       .size
       .height;
   final _width = MediaQuery
       .of(context)
       .size
       .width;
   return Card(
     elevation: 3.0,
     child: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 16.0),
       child: Padding(
         padding: const EdgeInsets.symmetric(vertical: 10.0),
         child: Column(
           children: <Widget>[
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 5.0),
               child: Row(
                 children: <Widget>[
                   Icon(Icons.location_on, color: Colors.blue,),
                   SizedBox(width: _width * 0.122,),
                   Column(
                     children: <Widget>[
                              AutoSizeText(
                                 "Location", style: TextStyle(fontSize: 17)),
                       SizedBox(height: _height * 0.00455,),
                       AutoSizeText(UserProfile [ "location"]??"",
                         style: TextStyle(color: Colors.grey),),
                     ],
                   ),
                 ],
               ),
             ),
             Divider(
               height: 10.0,
               color: Colors.grey,
             ),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 5.0),
               child: Row(
                 children: <Widget>[
                   Icon(Icons.local_shipping, color: Colors.blue,),
                   SizedBox(width: _width * 0.122,),
                   Column(
                     children: <Widget>[
                       AutoSizeText("Delivery address",
                           style: TextStyle(fontSize: 17)),
                       SizedBox(height: _height * 0.00455,),
                       AutoSizeText(UserProfile [ "addressDelivery"]??"",
                         style: TextStyle(color: Colors.grey),),
                     ],
                   ),
                 ],
               ),
             ),

             Divider(
               height: 10.0,
               color: Colors.grey,
             ),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 5.0),
               child: Row(
                 children: <Widget>[
                   Icon(Icons.visibility, color: Colors.blue,),
                   SizedBox(width: _width * 0.122,),
                   Column(
                     children: <Widget>[
                       AutoSizeText("Change Password",
                           style: TextStyle(fontSize: 17)),
                       SizedBox(height: _height * 0.00455,),
                       AutoSizeText(
                         UserProfile [ "password"]??"", style: TextStyle(color: Colors.grey),),
                     ],
                   ),
                 ],
               ),
             ),

             Divider(
               height: 10.0,
               color: Colors.grey,
             ),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 5.0),
               child: Row(
                 children: <Widget>[
                   Icon(Icons.monetization_on, color: Colors.blue,),
                   SizedBox(width: _width * 0.122,),
                   Column(
                     children: <Widget>[
                       AutoSizeText(
                           "Payment", style: TextStyle(fontSize: 17)),
                       SizedBox(height: _height * 0.00455,),

                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: <Widget>[
                           AutoSizeText("MpesaNumber-",
                             style: TextStyle(color: Colors.grey),),
                           AutoSizeText(UserProfile [ "mpesaNumber"]??"",
                             style: TextStyle(color: Colors.grey),),
                         ],
                       ),
                     ],
                   ),
                 ],
               ),
             ),

             Divider(
               height: 10.0,
               color: Colors.grey,
             ),

//             UserProfile [ "admin"] ? false : Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: adminfeature(),
//             ) ,

       Padding(
              padding: const EdgeInsets.all(8.0),
              child: adminfeature(),        ) ,
//
//           FutureBuilder(
//               future:collection("User").document(Provider.of(context).auth.getCurrentUID()).collection("UserProfile"),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.done) {}}
//           )

//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child:Text(UserProfile [ "admin"]?? "",)
//           )
        //   adminfeature()
            // if (Text("${UserProfile [ "admin"]},"){}
            // if (Text("${UserProfile [ "admin"]}," =="true"){}
            // Text("${UserProfile [ "admin"]},".value,style: TextStyle(color: white),).value
             //Text(UserProfile [ "displayName"] ?? adminfeature(),style: TextStyle(color: Colors.blue),)
           ],
         ),
       ),
     ),

   );
   _isAdmin = UserProfile [ "admin"]??false;

 }

 Widget editProfileButton() {
  //editMyProfileButton(Function function) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60.0,
          width: _width ,
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.blue
            ),
            color: white
            //borderRadius: BorderRadius.circular(20.0)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: RaisedButton(
                disabledColor: Colors.grey,
                color: white,

                //onPressed:Navigator.push(MaterialPageRoute(builder: (context)=>editprofile()));,
                 onPressed:()=>Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>new editprofile(user: newUser))),
               // onPressed: function,
                child: AutoSizeText("Fill my account details", style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ),
          ),
        ),
      );


 }
//   adminfeature() => RaisedButton(
//        onPressed:(){},
//        child: AutoSizeText("Log in Admin", style: TextStyle(
//          fontSize: 16.0,
//          color: Colors.blue,
//          fontWeight: FontWeight.bold,
//        ),),
     // );


  adminfeature(){
    if (_isAdmin == true){
      return Container(
        width:  MediaQuery
            .of(context)
            .size
            .width,
        height: 40.0,
        child: RaisedButton(
          elevation: 0.0,
          onPressed:(){
           // Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> Admin()));
          },
          disabledColor: white,
          color: white,

          child: AutoSizeText("Log in Admin", style: TextStyle(
            fontSize: 16.0,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),),
        ),
      );
    }
  }



//  getAdminData()async{
//    final uid=   await Provider.of(context).auth.getCurrentUID();
//await Provider.of(context).db.collection('User').document(uid).collection("UserProfile").get().then((result){
//  user.admin=result.data['admin'];
//});
//  }





}

