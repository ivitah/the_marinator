import 'package:flutter/material.dart';
import 'package:themarinator/pages/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  String _email;
  int _phoneNumber;
  String _password;
  String _confirmPassword;
  String _username;
  bool _toggleVisibility = true;
  bool _toggleConfirmVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Sign Up",style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 100.0,),
            Card(
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Your email or phone number",
                        hintStyle: TextStyle(
                          color:Color(0xFFBDC2CB) ,
                          fontSize: 18.0,
                        ),
                      ),
                      onChanged: (value){
                        setState(() {
                          _email =value;
                          _phoneNumber =value as int;

                        });
                      },
                    ),
                    SizedBox(height: 20.0,),



                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Username",
                        hintStyle: TextStyle(
                          color:Color(0xFFBDC2CB) ,
                          fontSize: 18.0,
                        ),
                      ),
                      onChanged: (value){
                        setState(() {
                          _username =value;

                        });
                      },
                    ),

                    SizedBox(height: 20.0,),

                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color:Color(0xFFBDC2CB) ,
                          fontSize: 18.0,
                        ),
                        suffixIcon: IconButton(
                            icon: _toggleVisibility?Icon(Icons.visibility_off):Icon(Icons.visibility),
                            onPressed:(){
                              setState(() {
                                _toggleVisibility=!_toggleVisibility;
                              });
                            })
                      ),
                      obscureText:_toggleVisibility,
                      onChanged: (value){
                        setState(() {
                          _password =value;

                        });
                      },
                    ),

                    SizedBox(height: 20.0,),

                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Confirm Password",
                          hintStyle: TextStyle(
                            color:Color(0xFFBDC2CB) ,
                            fontSize: 18.0,
                          ),
                          suffixIcon: IconButton(
                              icon: _toggleConfirmVisibility?Icon(Icons.visibility_off):Icon(Icons.visibility),
                              onPressed:(){
                                setState(() {
                                  _toggleConfirmVisibility=!_toggleConfirmVisibility;
                                });
                              })
                      ),
                      obscureText:_toggleConfirmVisibility,
                      onChanged: (value){
                        setState(() {
                          _confirmPassword =_password;

                        });
                      },
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(height: 30.0,),

            Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: GestureDetector(
                onTap:(){
                  FirebaseAuth.instance.createUserWithEmailAndPassword(email:_email, password:_password).then((signedInUser){
                    
                  }).catchError((e){
                    print(e);
                  });
                } ,
                child: Center(
                  child: Text("Sign Up",style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
            ),
            Divider(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Alraedy have an account?",style: TextStyle(
                  color:Color(0xFFBDC2CB) ,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
            ),
                ),
                SizedBox(width: 10.0,),

                GestureDetector(
                  onTap: ()=>Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context)=>new signin())),

                  child: Text("Sign In",style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
