import 'package:flutter/material.dart';
import 'package:themarinator/pages/signup.dart';

class signin extends StatefulWidget {
  @override
  _signinState createState() => _signinState();
}

class _signinState extends State<signin> {
  bool _toggleVisibility = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Sign In",style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 100.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text("Forgot password?",style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),),
              ],
            ),
            SizedBox(height: 10.0,),

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
              child: Center(
                child: Text("Sign In",style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ),
            Divider(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Don't have an account?",style: TextStyle(
                  color:Color(0xFFBDC2CB) ,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
                ),
                SizedBox(width: 10.0,),

                GestureDetector(
                  onTap: ()=>Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context)=>new signup())),

                  child: Text("Sign Up",style: TextStyle(
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
