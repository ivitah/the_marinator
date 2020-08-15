import 'package:flutter/material.dart';
import 'package:themarinator/pages/login.dart';
import 'package:themarinator/sha/Login.dart';
import 'package:themarinator/sha/services/auth.dart';
import 'package:themarinator/sha/signins/appview.dart';
import 'package:themarinator/sha/signins/sign_up_auth.dart';
import 'file:///C:/Users/User/AndroidStudioProjects/flutter_project/the_marinator/lib/bottombar/home.dart';
import 'package:themarinator/src/homescreen.dart';
import 'package:themarinator/sha/services/provider.dart';

void main() =>runApp(MyMarinator());

class MyMarinator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: authService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: homescreen(),
        //home: login(),
        //home:signUpView(),
        home: HomeController(),


        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => HomeController(),
          //finna break down things pour moi daccord...ummhhh...so this sign up is assigned the value of a sign up route(button found on page
          //sign up...of auth type sign up..kama hujarada btw ebu zubaa
         '/signUp': (BuildContext context) => signUpView (authFormType: AuthFormType.signUp),
          '/signIn': (BuildContext context) => signUpView(authFormType: AuthFormType.signIn),
          '/convertUser': (BuildContext context) => signUpView(authFormType: AuthFormType.convert),
          '/anonymousSignIn': (BuildContext context) => signUpView(authFormType: AuthFormType.anonymous),
         // '/myaccountPage': (BuildContext context) => myaccountPage(),
        },
      ),
    );
  }
}

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService auth = Provider.of(context).auth;
    return StreamBuilder<String>(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? homescreen()  : FirstView();
        }
        return CircularProgressIndicator();
      },
    );
  }
}

