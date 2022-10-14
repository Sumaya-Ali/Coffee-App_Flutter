import 'package:coffee_app/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: Text('Sign in to Coffee App'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: ElevatedButton(
          child: Text('Sign in anon'),
          style: ElevatedButton.styleFrom(
            primary: Colors.brown[400]
          ),
          onPressed: () async{
            dynamic result = await _auth.SignInAnon();
            if(result == null){
              print ('error signing in');
            }else{
              print('signing in successfully');
              print(result.uid);
            }
          },
        ),
      ),
    );
  }
}
