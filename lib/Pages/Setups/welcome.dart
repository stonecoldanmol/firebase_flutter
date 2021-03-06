import 'package:firebase_flutter/Pages/Setups/LoginPage.dart';
import 'package:firebase_flutter/Pages/Setups/sign_up.dart';
import 'package:flutter/material.dart';


class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My firebase App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              onPressed: navigateToSignIn,
              child: Text('Sign In'),
            ),
            RaisedButton(
              onPressed: navigateToSignUp,
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToSignIn(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage(),fullscreenDialog: true));
  }

  void navigateToSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage(),fullscreenDialog: true));
  }



}
