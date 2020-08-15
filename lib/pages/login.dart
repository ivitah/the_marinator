//import 'package:flutter/material.dart';
//
//
////googlestuff imports
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//
//
////own imports
//import 'package:themarinator/src/homescreen.dart';
//
//
//class login extends StatefulWidget {
//  @override
//  _loginState createState() => _loginState();
//}
//
//class _loginState extends State<login> {
//  final GoogleSignIn googleSignIn=new GoogleSignIn();
//  final FirebaseAuth firebaseAuth =FirebaseAuth.instance;
//  SharedPreferences preferences;
//  bool loading  = false;
//  bool isLoggedin = false;
//
//
//  @override
//  void initState() {
//    super.initState();
//    isSignedIn();
//
//  }
//  void isSignedIn() async{
//    setState(() {
//      loading=true;
//    });
//    preferences = await SharedPreferences.getInstance();
//    isLoggedin = await googleSignIn.isSignedIn();
//    if(isLoggedin){
//      Navigator.pushReplacement(context,MaterialPageRoute(builder:( context)=>homescreen()));
//    }
//    setState(() {
//      loading= false;
//    });
//  }
//
//  Future handleSignedIn()async{
//    preferences = await SharedPreferences.getInstance();
//    setState(() {
//      loading = true;
//    });
//
//    GoogleSignInAccount googleUser = await googleSignIn.signIn();
//    GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;
//    FirebaseUser firebaseUser = await firebaseAuth.signInWithGoogle(idToken: googleSignInAuthentication.idToken, accessToken:googleSignInAuthentication.accessToken);
////    AuthCredential credential = GoogleAuthProvider.getCredential(
////        idToken: googleSignInAuthentication.idToken,
////        accessToken: googleSignInAuthentication.accessToken);
////    FirebaseUser firebaseUser = (await firebaseAuth.signInWithCredential(credential)).user;
////
//    if(firebaseUser != null) {
//      final QuerySnapshot result = await Firestore.instance.collection("Users")
//          .where("id", isEqualTo: firebaseUser.uid)
//          .getDocuments();
//      final List<DocumentSnapshot> documents = result.documents;
//      if (documents.length == 0) {
//        //ie.add the user to our collection
//        Firestore.instance.collection("Users")
//            .document(firebaseUser.uid)
//            .setData({
//          "id": firebaseUser.uid,
//          "Username": firebaseUser.displayName,
//          "profile picture": firebaseUser.photoUrl,
//        });
//
//        await preferences.setString("id", firebaseUser.uid);
//        await preferences.setString("Username", firebaseUser.displayName);
//        await preferences.setString("photoUrl", firebaseUser.displayName);
//      }
//      else {
//        await preferences.setString("id", documents [0]['id']);
//        await preferences.setString("Username", documents [0]['Username']);
//        await preferences.setString("photoUrl", documents [0]['photoUrl']);
//      }
//      Fluttertoast.showToast(msg: "LogIn was successsful");
//      setState(() {
//        loading = false;
//      });
//    }else{
//      Fluttertoast.showToast(msg: "Login failed:(  ");
//      setState(() {
//        isLoggedin = true;
//      });
//    }
//  }
//  @override
//  Widget build(BuildContext context) {
//   // return Container();
//    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.white,
//        centerTitle: true,
//        title: new Text("Login", style: TextStyle(color: Colors.red.shade900),),
//        elevation: 0.1,
//      ),
//      body: Stack(
//        children: <Widget>[
//          Center(
//            child: FlatButton(
//              color: Colors.red.shade900,
//              onPressed: (){
//                handleSignedIn();
//              },child: Text("sing in / Sign up with google",style: TextStyle(color: Colors.white),),
//            ),
//          ),
//
//          Visibility(
//            visible: loading ?? true,
//            child: Center(
//              child: Container(
//                alignment: Alignment.center,
//                color: Colors.white.withOpacity(0.9),
//                child: CircularProgressIndicator(
//                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
//                ),
//              ),
//            ),
//          )
//        ],
//      ),
//    );
//  }
//
//}
