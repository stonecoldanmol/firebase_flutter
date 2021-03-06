import 'package:firebase_flutter/Pages/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String _email,_password;
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Form(
        ///TODO : implement Keys
        key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                  validator: (input){
                    if(input.isEmpty){
                      return 'Please Type an Email';
                    }
                  },
                onSaved: (input)=> _email=input,
                decoration: InputDecoration(
                  labelText: 'Email'
                ),
              ),
              TextFormField(
                validator: (input){
                  if(input.length < 6){
                    return 'Your Password Needs to be atleast 6 characters';
                  }
                },
                onSaved: (input)=> _password=input,
                decoration: InputDecoration(
                    labelText: 'Password'
                ),
                obscureText: true,
              ),
              RaisedButton(
                  onPressed: signIn,
                child: Text('Sign In'),
              ),
            ],
          )
      ),
    );
  }
  Future<void> signIn() async{
    final formState= _formKey.currentState;

    if(formState.validate()){
      formState.save();
      try{
        AuthResult user = await FirebaseAuth.instance.
        signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
      }catch(e){
        print(e.message);
      }

    }
  }
}