//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:themarinator/models/users.dart';
//import 'package:themarinator/sha/services/auth.dart';
//
//
//
//class databaseService {
//
//  final String uid;
//
//  databaseService({this.uid});
//
//  // collection reference
//  final CollectionReference usersCollection = Firestore.instance.collection('MyUsersDetais');
//
//
//  //once a anew user signs up for the app he is going to be saved to database using this method(like finnaarrrrreeeee....been a task bana....)
//  Future updateUserData(String name,String location,String deliveryAdreess,int phoneNumber,String email,int mpesaLipaNumber,String photoUrl,bool Admin)async{
//    return await usersCollection.document(uid).setData({
//      'name':name,
//      'email':email,
//      'location':location,
//      'deliveryAdreess':deliveryAdreess,
//      'phoneNumber':phoneNumber,
//      'mpesaLipaNumber':mpesaLipaNumber,
//      'photoUrl':photoUrl,
//      'Admin':Admin,
//
//    });
//  }
//  //userdetails list from a snapshotbase....cycles through the items that are there and then outputs the required wharever as called....
//  //the ones in string from database the ones without from class User in user dart
//  //This function goes to the data
//  List<User> _usersDetailsFromSnapshot(QuerySnapshot snapshot){
//    return snapshot.documents.map((doc){
//      return User(
//        username: doc.data['name']??"",
//        email: doc.data['email']??"",
//        addressDelivery: doc.data['addressDelivery']??"",
//        location: doc.data['location']??"",
//        password: doc.data['password']??"",
//        mpesaNumber: doc.data['mpesaNumber']?? 07,
//        photoUrl: doc.data['photoUrl']??"",
//        displayName: doc.data['displayName']??"",
//      );
//    }).toList();
//  }
//
////get MyUserDetails Stream
// Stream <List<User>> get MyUserDetails{
//    return usersCollection.snapshots().map(_usersDetailsFromSnapshot);
// }
//}