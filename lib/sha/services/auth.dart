import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:themarinator/sha/services/database.dart';


class authService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;//inshort kabla ya kutumia firebase auth.instance kila saa tunaipea a final
  //variable yenye inaitwa _firebase Auth...same applies to google:)
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  //will enable us to knoe ehich login page the euser is in
  Stream<String> get onAuthStateChanged => _firebaseAuth.onAuthStateChanged.map((FirebaseUser user) => user?.uid,);

  // GET UID
  Future<String> getCurrentUID() async {
    return (await _firebaseAuth.currentUser()).uid;
  }
  // GET CURRENT USER
  Future getCurrentUser() async {
    return await _firebaseAuth.currentUser();
  }

  //email and password sign up

  // Email & Password Sign Up
  Future<String> createUserWithEmailAndPassword(String email, String password,
      String name) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    // Update the username
    await updateUserName(name, authResult.user);
    //gives the new user some properties but now on database ya dig.....finaareeee
   // await databaseService(uid:authResult.user.uid).updateUserData(name, 'Nairobi', 'Archives', 2547, email, 2547,'',false);
   // await databaseService(uid:getCurrentUser().uid).updateUserData(name, location, deliveryAdreess, phoneNumber, email, mpesaLipaNumber);
    return authResult.user.uid;
}

//to idk what exactly buh its sumn about username andupdating it
Future updateUserName(String name, FirebaseUser currentUser) async {
   var userUpdateInfo=UserUpdateInfo();
  userUpdateInfo.displayName = name;
  await currentUser.updateProfile(userUpdateInfo);
  await currentUser.reload();
}


//email and password sign in

  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    return (await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password)).user.uid;
  }

//email and password sign out

  signOut() {
    return _firebaseAuth.signOut();
  }

  // Reset Password
  //the reset link password ....rememmber....this is the route
  Future sendPasswordResetEmail(String email) async {
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }


  // Create Anonymous User
  Future singInAnonymously() {//he wrote sing:)

    return _firebaseAuth.signInAnonymously();
  }

//so well these functions are used to convert the anonymous user to a registered user instead of adding em up as a diiff user nd
  //giving us false data warever
  Future convertUserWithEmail(String email, String password, String name) async {
    final currentUser = await _firebaseAuth.currentUser();

    final credential = EmailAuthProvider.getCredential(email: email, password: password);


    //gives the new user some properties but now on database ya dig.....finaareeee
   // await databaseService(uid:currentUser.uid).updateUserData(name, 'Nairobi', 'Archives', 2547, email, 2547,'',false);
    await currentUser.linkWithCredential(credential);
    await updateUserName(name, currentUser);
  }

  Future converWithGoogle() async {
    final currentUser = await _firebaseAuth.currentUser();
    final GoogleSignInAccount account = await _googleSignIn.signIn();
    final GoogleSignInAuthentication _googleAuth = await account.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: _googleAuth.idToken,
      accessToken: _googleAuth.accessToken,
    );
    await currentUser.linkWithCredential(credential);
    await updateUserName(_googleSignIn.currentUser.displayName, currentUser);
  }

  // GOOGLE
  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount account = await _googleSignIn.signIn();
    final GoogleSignInAuthentication _googleAuth = await account.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: _googleAuth.idToken,
      accessToken: _googleAuth.accessToken,
    );
    //gives the new user some properties but now on database ya dig.....finaareeee
   // await databaseService(uid:(await _firebaseAuth.signInWithCredential(credential)).user.uid).updateUserData('', 'Nairobi', 'Archives', 2547,'', 2547,'',false);
    return (await _firebaseAuth.signInWithCredential(credential)).user.uid;

  }
  //the below function is actually used to call out verification codes yah dig?
  Future createUserWithPhone(String phone,BuildContext context){
    _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds:0),
        verificationCompleted: (AuthCredential authCredential) {
   // _firebaseAuth.signInWithCredential(authCredential).then((FirebaseUser result){
    _firebaseAuth.signInWithCredential(authCredential).then((AuthResult result){
    Navigator.of(context).pushReplacementNamed('/home');
    }).catchError((e) {
      return "error";
    });
        },
        verificationFailed:(AuthException exception){
          return "error";
        },
        codeSent: (String verificationId, [int forceResendingToken] ){//verification id is the value of verification id in controller
          final _codeController = TextEditingController();
          showDialog(
              context: context,
            barrierDismissible: false,
            builder:(context) =>AlertDialog(
              //just but ctics of alert dialog configure usishtuke saaanaaaa:)
              title: Text("Enter Verification Code From Text Message"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[TextField(controller: _codeController)//code controller is the value of the sms code
                ],
              ),
              actions: <Widget>[
                FlatButton(
                  child:Text("Submit"),
                  textColor: Colors.white,
                  color: Colors.green,
                  onPressed: (){
                    var _credential = PhoneAuthProvider.getCredential(verificationId: verificationId,
                        smsCode: _codeController.text.trim());
                  //  _firebaseAuth.signInWithCredential(_credential).then((FirebaseUser result){
                    _firebaseAuth.signInWithCredential(_credential).then((AuthResult result){
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacementNamed('/home');
                    }).catchError((e) {
                      return "error";
                    });
                  },
                ),
              ],
            )
          );
        },
        codeAutoRetrievalTimeout:(String verificationId) {
          verificationId = verificationId;
        });
  }

}
//name validator in sign up
class NameValidator {
  static String validate(String value) {
    if(value.isEmpty) {
      return "Name can't be empty";
    }
    if(value.length < 2) {
      return "Name must be at least 2 characters long";
    }
    if(value.length > 20) {
      return "Name must be less than 20 characters long";
    }
    return null;
  }
}
//email validator for yk
class EmailValidator {
  static String validate(String value) {
    if(value.isEmpty) {
      return "Email is empty";
    }
    return null;
  }
}
//password validator
class PasswordValidator {
  static String validate(String value) {
    if(value.isEmpty) {
      return "Password is empty";
    }
    return null;
  }
}