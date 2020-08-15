import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class User{
   String username;
   String displayName;
   String location;
   String addressDelivery;
   String mpesaNumber;
   String email;
   String photoUrl;
   String password;
   bool admin;

  User({this.username, this.location, this.addressDelivery, this.mpesaNumber,
    this.email,this.photoUrl,this.displayName,this.password,
    this.admin
  });

  Map<String,dynamic>toJson()=>{
    'username':username,
    'displayName':displayName,
    'location':location,
    'addressDelivery':addressDelivery,
    'mpesaNumber':mpesaNumber,
    'email':email,
    'photoUrl':photoUrl,
    'password':password,
   'admin':admin,
  };


}