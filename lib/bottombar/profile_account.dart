import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
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
  final newUser=  new User(displayName:'',mpesaNumber:'',location:'',username:'',email:'',photoUrl:'',addressDelivery:'',password:'',
    //admin: false
  );
  bool turnOnNotification = false;
  bool turnOnLocation = false;
  AuthFormType authFormType;

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
        displayUserExtraInformation(context, user.isAnonymous)
      ],
    );
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
      return  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: _height * 0.0325,),
                AutoSizeText("Account", style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),),
               FutureBuilder(
                   future: _getProfileData(),
                   builder: (context,snapshot){
                     if (snapshot.connectionState == ConnectionState.done) {
                       //return Text("whaaaaaaaaaat");

                     } else {
                       return CircularProgressIndicator();
                     }
                   }),

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
  }
  final db = Firestore.instance;


  _getProfileData() async {
    final uid=   await Provider.of(context).auth.getCurrentUID();
    QuerySnapshot snapshot =await db.collection("User").document(uid).get().then((results){
      newUser.location= results.data['location'];
      newUser.addressDelivery= results.data['addressDelivery'];
      widget.user.addressDelivery= results.data['addressDelivery'];
      newUser.mpesaNumber= results.data['location'];
     // widget.user.mpesaNumber= results.data['location'];
      newUser.password= results.data['password'];
     // widget.user.password= results.data['password'];
      newUser.admin= results.data['admin'];

    });
   // await db.collection("User").document(uid).setData(widget.user.toJson());


  }
  //private fun
//  getUserProfile() async{
//    final uid=   await Provider.of(context).auth.getCurrentUID();
//
//    Firestore.instance.collection('User').document(uid).addSnapshotListener(snapshot){
//
//    }

//  User user;
//
//    surely()async{
//      final uid=   await Provider.of(context).auth.getCurrentUID();
//      QuerySnapshot snapshot= await Firestore.instance.collection('User').document(uid).getDocuments().then((results){
//      user.addressDelivery = results.documents.
//    });
//    List<User> _userdata=[];
//    snapshot.documents.forEach((document) {
//      User userInfo=yuser.addressDelivery.
//    })




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
            ],
          ),
        ),
      ),
    );

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
//  editProfileButton(){
//    return editMyProfileButton(
//      editProfileFunction()
//    );
//  }

}

