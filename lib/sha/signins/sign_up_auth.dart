import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:themarinator/bottombar/myaccount.dart';
import 'package:themarinator/sha/services/provider.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:international_phone_input/international_phone_input.dart';



import 'package:firebase_auth/firebase_auth.dart';
import 'package:themarinator/sha/services/auth.dart';

import '../../main.dart';


//todo in tone location
final primaryColor = const Color(0xFFBDC2CB);
//final primaryColor = const Color(0xFF75A2EA);
enum AuthFormType { signIn, signUp ,reset,anonymous,convert,phone}



class signUpView extends StatefulWidget {
  final AuthFormType authFormType;

  signUpView({Key key, @required this.authFormType}) : super(key: key);


  @override
  _signUpViewState createState() => _signUpViewState(authFormType: this.authFormType);
}

class _signUpViewState extends State<signUpView> {
//tres important pour le password
  bool _toggleVisibility = true;


  AuthFormType authFormType;

  _signUpViewState({this.authFormType});

  final formKey = GlobalKey<FormState>();
  String _email, _password, _name,_warning,_phone;
//enables one to toggle between the sign up and sign in pages....it'll be called later in the page

  void switchFormState(String state) {
    formKey.currentState.reset();
    if (state == "signUp") {
      setState(() {
        authFormType = AuthFormType.signUp;
      });
   } else if(state == "home"){
      setState(() {
        Navigator.of(context).pushNamed('/home');
      });

    } else {
      setState(() {
        authFormType = AuthFormType.signIn;
      });
    }
  }

  bool validate() {
    //this was previously below in the submit fuction then kapoof we had to validate the form ie.whether we had data or we being bebwad
    final form = formKey.currentState;
    if(authFormType==AuthFormType.anonymous){
      return true;
    }
    form.save();
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void submit() async {
    if (validate()){
      try {

        //the auth isn't directly taken from the provider instead go to provider then to auth...hence enables consistency plus also the ability of the app to keep track of the users
        final auth = Provider.of(context).auth;
        switch(authFormType){
          case AuthFormType.signIn:
            await auth.signInWithEmailAndPassword(_email, _password);
            Navigator.of(context).pushReplacementNamed('/home');
            break;
          case AuthFormType.signUp:
            await auth.createUserWithEmailAndPassword(
                _email, _password, _name);
            Navigator.of(context).pushReplacementNamed('/home');
            break;
          case AuthFormType.reset:
            await auth.sendPasswordResetEmail(_email);
            _warning = "A password reset link has been sent to $_email";
            setState(() {
              authFormType = AuthFormType.signIn;
            });
            break;
          case AuthFormType.anonymous:
            await auth.singInAnonymously();
            Navigator.of(context).pushReplacementNamed('/home');
            break;
          case AuthFormType.convert:
            await auth.convertUserWithEmail(_email, _password, _name);
            Navigator.of(context).pop();
            break;
          case AuthFormType.phone:
            var result =  await auth.createUserWithPhone(_phone,context);
            if(_phone =="" ||  result == "error"){
              setState(() {
                _warning= "Your phone number could not be validated";
              });

            }
        }


//        if(authFormType == AuthFormType.signIn) {
//          String uid = await auth.signInWithEmailAndPassword(_email, _password);
//          print("Signed In with ID $uid");
//          Navigator.of(context).pushReplacementNamed('/home');
//        } else if(authFormType == AuthFormType.reset) {
//          await auth.sendPasswordResetEmail(_email);
//          print("Password reset email sent");
//          _warning="A password reset link has been sent to $_email";
//          setState(() {
//            authFormType =AuthFormType.signIn;
//          });
//        }
//        else {
//          String uid = await auth.createUserWithEmailAndPassword(_email, _password, _name);
//          print("Signed up with New ID $uid");
//          Navigator.of(context).pushReplacementNamed('/home');
//        }
      } catch (e) {
        print (e);
        setState(() {
          //this below function enables one to be able to see kina invalid error...options only seen in console bc they from firebase
          _warning= e.message;
        });
      }
    }
    //if you finna sign in to firebase without this small portion below
    //it'll return an error of null bc the form has not been saved hence nothing to be submitted...ya dig?
//    final form = formKey.currentState;
//    form.save();
  }

//  Future submitAnonymous() async {
//    final auth = Provider.of(context).auth;
//    await auth.singInAnonymously();
//    Navigator.of(context).pushReplacementNamed('/home');
//  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    if (authFormType == AuthFormType.anonymous) {
      //submit();
      submit();
      return Scaffold(
//          backgroundColor: primaryColor,
//          body: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              SpinKitDoubleBounce(color: Colors.white,),
//              Text("Loading", style: TextStyle(color: Colors.white),),
//            ],
//          )
//      );
      backgroundColor: primaryColor,
    body: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    SpinKitDoubleBounce (//this umhhh...is the kaloading dart sijui kama unanyita
    color: Colors.white,
    ),
    Text(
    "Loading",
    style: TextStyle(color: Colors.white),
    ),
    ],
    ));
    }

    else {
      return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          color: primaryColor,
          height: height,
          width: width,
          child: SafeArea(
              child: Column(
                children: <Widget>[
                  SizedBox(height: height * 0.025,),
                  showAlert(),
                  SizedBox(height: height * 0.025,),
                  buildHeaderSizeText(),
                  SizedBox(height: height * 0.05,),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: buildInputs() + buildButtons(),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      );
    }
  }

  Widget showAlert() {
   // if (_warning != null) {
      if (_warning != null) {
        return Container(
          color: Colors.amberAccent,
          width: double.infinity,
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.error_outline),
              ),
              Expanded(
                child: AutoSizeText(
                  //_warning,
                  _warning,
                  maxLines: 3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                    //  _warning = null;
                      _warning = null;
                    });
                  },
                ),
              )
            ],
          ),
        );
      }
      return SizedBox(
        height: 0,
      );
    }
  //}will be added when the warning method is created ight

  // -----------------------------------------------------------header method we just extracted  :)

  AutoSizeText buildHeaderSizeText() {
    String _headerText;
    if (authFormType == AuthFormType.signIn) {
      _headerText = "Sign In";
    }else if (authFormType == AuthFormType.reset) {
      _headerText = "Reset Password";
     }else if (authFormType == AuthFormType.phone) {
       _headerText = "Phone signIn";
  }
    else {
      _headerText = "Create New Account";

    }
    return AutoSizeText(
                _headerText
                ,maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 35,
                color: Colors.white
              ),
              );
  }

  //phone number blablabla................................................................
  //IGHT...NOW i GERRIT...VALIDATES PHONE NUMBER FROM DIFF COUNTRY CODES
  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      _phone = internationalizedPhoneNumber;
      print(internationalizedPhoneNumber);
    });
  }



  //listttings yk..............................WHERE THE FORMS ARE BUILT------------------------------------------------------
  List<Widget> buildInputs() {
    List<Widget> textFields = [];

    if(authFormType == AuthFormType.reset){
      textFields.add(
        TextFormField(
          validator: EmailValidator.validate,
          style: TextStyle(fontSize: 20.0),
          decoration: buildSignUpInputDecoration("Email"),
          onSaved: (value) => _email = value,
        ),
      );
      textFields.add(SizedBox(height: 20));
      return textFields;
    }

    // if were in the sign up state add name

    if (authFormType == AuthFormType.signUp||authFormType ==AuthFormType.convert) {//if the form type contains either named then...
   // if ([authFormType == AuthFormType.signUp,AuthFormType.convert].contains(authFormType)) {//if the form type contains either named then...
      textFields.add(
        TextFormField(
          validator: NameValidator.validate,
          style: TextStyle(fontSize: 20.0),
          decoration: buildSignUpInputDecoration("Username"),
          onSaved: (value) => _name = value,
        ),
      );
      textFields.add(SizedBox(height: 20));
    }

    // add email & password

    if (authFormType ==AuthFormType.convert||authFormType ==AuthFormType.reset||authFormType ==AuthFormType.signIn||authFormType ==AuthFormType.anonymous||authFormType ==AuthFormType.signUp) {
    //if ([authFormType ==AuthFormType.convert,AuthFormType.reset,AuthFormType.signIn,AuthFormType.anonymous,AuthFormType.signUp].contains(authFormType)) {
      textFields.add(
        TextFormField(
          validator: EmailValidator.validate,
          style: TextStyle(fontSize: 20.0),
          decoration: buildSignUpInputDecoration("Email"),
          onSaved: (value) => _email = value,
        ),
      );

      textFields.add(SizedBox(height: 20));
    }

    if (authFormType !=AuthFormType.phone && authFormType != AuthFormType.reset ) {
      textFields.add(
        TextFormField(
          //doing my custom wharever
          validator: PasswordValidator.validate,
          //..................................for password obscure...............................................
          style: TextStyle(fontSize: 20.0),
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 0.0)),
              contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 10.0, top: 10.0),
              hintText: ("Password"),
              hintStyle: TextStyle(
                color: Color(0xFFBDC2CB),
                fontSize: 18.0,
              ),
              suffixIcon: IconButton(
                  icon: _toggleVisibility ? Icon(Icons.visibility_off) : Icon(
                      Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _toggleVisibility = !_toggleVisibility;
                    });
                  })
          ),
          obscureText: _toggleVisibility,
          onSaved: (value) => _password = value,
        ),
      );
      textFields.add(SizedBox(height: 20));
    }

    if (authFormType ==AuthFormType.phone) {
      textFields.add(
//        TextFormField(
//          validator: EmailValidator.validate,
//          style: TextStyle(fontSize: 20.0),
//          decoration: buildSignUpInputDecoration("Enter phone"),
//          onSaved: (value) => _phone= value,
//        ),

        InternationalPhoneInput(
            decoration: buildSignUpInputDecoration("Enter Phone Number"),
            onPhoneNumberChange: onPhoneNumberChange,
            initialPhoneNumber: _phone,
            initialSelection: 'Kenya',
            enabledCountries: ['+254'],
            //showCountryCodes:false,
           showCountryCodes: true,
        ),
      );

      textFields.add(SizedBox(height: 20));
    }
    return textFields;

  }

  InputDecoration buildSignUpInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      focusColor: Colors.white,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0.0)),
      contentPadding:
      const EdgeInsets.only(left: 14.0, bottom: 10.0, top: 10.0),
    );
  }

  //---------------------------------------------------------------------------------built buttons
  List<Widget> buildButtons() {
    String _switchButtonText, _newFormState, _submitButtonText;
    bool _showForgotPassword = false;//this line will always be false hence no need of popping it up...unless well...true?
    bool _showSocial =true;

    if (authFormType == AuthFormType.signIn) {
      _switchButtonText = "Create New Account";
      _newFormState = "signUp";
      _submitButtonText = "Sign In";
      _showForgotPassword = true;
    } else if(authFormType == AuthFormType.reset){
      _switchButtonText = "Return to SignIn";
      _newFormState = "signIn";
      _submitButtonText = "Submit";
      _showSocial =false;

  }  else if(authFormType == AuthFormType.phone){
  _switchButtonText = "Cancel";
  _newFormState = "signIn";
  _submitButtonText = "Continue";
  _showSocial =false;

  } else if(authFormType == AuthFormType.convert){
  _switchButtonText = "Cancel";
  _newFormState = "home";
  _submitButtonText = "signUp";
  } else {
      _switchButtonText = "Have an Account? Sign In";
      _newFormState = "signIn";
      _submitButtonText = "Sign Up";
    }

    //----------------------------------------home of buttons.....mwahahahahahahahahhhahahahahhahahahaahahahahahahahahahhahaha
    return [
      Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)),
          color: Colors.lightBlue,
          textColor: primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _submitButtonText,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500,color: Colors.white),
            ),
          ),
          onPressed: submit,
        ),
      ),

      showForgotPassword(_showForgotPassword),

      FlatButton(
        child: Text(
          _switchButtonText,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          switchFormState(_newFormState);
        },
      ),

      buildSocialIcons(_showSocial),
    ];
  }

  Widget showForgotPassword(bool visible) {
    //used this visibility widget bc it has a visible action which has been called above...hio ikona bool...bila visibility widget hatuwezi jua kama ni visible or not
    return Visibility(
      child: FlatButton(
        child: Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          setState(() {
            authFormType = AuthFormType.reset;
          });
        },
      ),
      visible: visible,
    );
  }

  Widget buildSocialIcons(bool visible) {
    final _auth = Provider.of(context).auth;
    return Visibility(
      child: Column(
        children: <Widget>[
          Divider(
            color: Colors.white,
          ),
          SizedBox(height: 10),
          Container(
            width:  MediaQuery.of(context).size.width*0.58,
            child: GoogleSignInButton(
              onPressed: () async {
                try {
                if(authFormType == AuthFormType.convert) {
                    await _auth.converWithGoogle();
                   Navigator.of(context).pop();
                  } else {
                    await _auth.signInWithGoogle();
                    Navigator.of(context).pushReplacementNamed('/home');
                  }
                } catch (e) {
                  setState(() {
                    print(e);
                    _warning = e.message;
                  });
                }
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.025 ),
          Container(
            width:  MediaQuery.of(context).size.width*0.58,
            child: RaisedButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.phone),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 14.0, top: 10.0, bottom: 10.0),
                      child: Text("Sign in with Phone",
                          style: TextStyle(fontSize: 18)),
                    )
                  ],
                ),
                onPressed:(){
                  setState(() {
                    authFormType = AuthFormType.phone;
                  });
                }
            ),
          )
        ],
      ),
      visible: visible,
    );
  }
}


