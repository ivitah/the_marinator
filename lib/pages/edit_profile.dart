 import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
 import 'package:auto_size_text/auto_size_text.dart';
import 'package:themarinator/sha/services/provider.dart';
import 'package:themarinator/widget/commons.dart';
import 'package:themarinator/models/users.dart';



//class editprofile extends StatefulWidget {
class editprofile extends StatefulWidget {
  //-----------------------------------------my bebe 1manstartup codes------------------------------------------------------------tihihihi
  final User user;
  final formKey = GlobalKey<FormState>();


  editprofile({Key key,@required this.user}):super (key:key);
  final _scaffoldkey = GlobalKey<ScaffoldState>();


  @override
  _editprofileState createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
  //GlobalKey<FormState>().currentState.save();
  final _scaffoldkey = GlobalKey<ScaffoldState>();

  final db = Firestore.instance;

  TextEditingController _locationController = new TextEditingController();

  TextEditingController _addressDeliveryController = new TextEditingController();

  TextEditingController _mpesaNumberController = new TextEditingController();

  TextEditingController _passwordController = new TextEditingController();

 // final uid=   await Provider.of(context).auth.getCurrentUID();

  @override
  Widget build(BuildContext context) {

    TextEditingController _usernameController = new TextEditingController();
   // _usernameController.text= user.username;
    return Scaffold(
      key:_scaffoldkey,
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: AutoSizeText("Edit Profile",style: TextStyle(color: Colors.black,fontSize: 21.0),),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon:Icon(Icons.cancel,
          size: 30.0,
              color: Colors.green,),
              onPressed:()=>Navigator.pop(context),
          )
        ],
      ),
      body:
      //isLoading?SpinKitChasingDots(color: Colors.blue,):
          ListView(
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical:12.0),
                          child: CircleAvatar(
                            radius: 50.0,
                             // backgroundImage: CachedNetworkImageProvider(user.photourl),
                          ),
                        ),

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          buildLocationField(),
                          buildDeliveryAddressField(),
                          buildChangePasswordField(),
                          buildMpesaNumberField()
                        ],
                      ),
                    ),
                    RaisedButton(
                      onPressed: () async

                    {
                      widget.user.location=_locationController.text;
                      widget.user.addressDelivery=_addressDeliveryController.text;
                      widget.user.password=_passwordController.text;
                      widget.user.mpesaNumber=_mpesaNumberController.text;
                     final uid=   await Provider.of(context).auth.getCurrentUID();
                     //await db.collection("User").document(uid).setData(widget.user.toJson());

                      //used to create a whote other collection instead of just setting the data
                      await db.collection("User").document(uid).collection("UserProfile").add(widget.user.toJson());
                      Navigator.pop(context);
                      //                      await Provider.of(context).db.collection("MyUsersDetails").document(uid).setData(user.toJson());

                      // await db.collection("UserProfile").add(user.toJson());
                     // await db.collection("MyUsersDetails").add(user.toJson()).document(uid).setData(user.toJson());
                      //await db.collection("MyUsersDetails")
                      setState(() {
                        _locationController.text=widget.user.location;
                        _addressDeliveryController.text=widget.user.addressDelivery;
                        _passwordController.text=widget.user.password;
                        _mpesaNumberController.text=widget.user.mpesaNumber;
                      });
                    },


                      child: Text("Update Profile",style: TextStyle(
                        color:Colors.purple,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),),
                    )
                  ],
                ),
              )
            ],
          )
    );
  }

  buildLocationField(){
    _locationController.text= widget.user.location;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AutoSizeText("Location",
          style: TextStyle(
           // color: Colors.grey
          ),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _locationController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: "Update your location",
              hintStyle:TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        )
      ],
    );
  }

  buildDeliveryAddressField(){
    _addressDeliveryController.text= widget.user.addressDelivery;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AutoSizeText("DeliveryAddress",
          style: TextStyle(
           // color: Colors.grey
          ),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _addressDeliveryController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: "Fill in your DeliveryAddress",
              hintStyle:TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        )
      ],
    );
  }

  buildChangePasswordField(){
    _passwordController.text= widget.user.password;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AutoSizeText("ChangePassword",
          style: TextStyle(
           // color: Colors.grey
          ),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _passwordController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: "Key in new password",
              hintStyle:TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        )
      ],
    );
  }

  buildMpesaNumberField(){
    _mpesaNumberController.text= widget.user.mpesaNumber;
//   keyboardType:TextInputNumber;


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AutoSizeText("MpesaNumber",
          style: TextStyle(
           // color: Colors.grey
          ),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _mpesaNumberController,
            autofocus: true,
            decoration: InputDecoration(
              hintText:"Your lipa with Mpesa number",
              hintStyle:TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        )
      ],
    );
  }

//  save() {
//    //this was previously below in the submit fuction then kapoof we had to validate the form ie.whether we had data or we being bebwad
//    final form = formKey.currentState;
//    form.save();
//  }
//
//  void submit() async {
//    if (save()){
//
//    }
//
//
////        if(authFormType == AuthFormType.signIn) {
////          String uid = await auth.signInWithEmailAndPassword(_email, _password);
////          print("Signed In with ID $uid");
////          Navigator.of(context).pushReplacementNamed('/home');
////        } else if(authFormType == AuthFormType.reset) {
////          await auth.sendPasswordResetEmail(_email);
////          print("Password reset email sent");
////          _warning="A password reset link has been sent to $_email";
////          setState(() {
////            authFormType =AuthFormType.signIn;
////          });
////        }
////        else {
////          String uid = await auth.createUserWithEmailAndPassword(_email, _password, _name);
////          print("Signed up with New ID $uid");
////          Navigator.of(context).pushReplacementNamed('/home');
////        }
//      } catch (e) {
//        print (e);
//        setState(() {
//          //this below function enables one to be able to see kina invalid error...options only seen in console bc they from firebase
//          _warning= e.message;
//        });
//      }
//    }
//    //if you finna sign in to firebase without this small portion below
//    //it'll return an error of null bc the form has not been saved hence nothing to be submitted...ya dig?
////    final form = formKey.currentState;
////    form.save();
//  }
//





}

