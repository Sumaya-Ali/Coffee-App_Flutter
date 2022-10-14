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

  String email ='';
  String password ='';

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
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 20.0,),
              TextFormField(
                onChanged: (val){
                  setState(() => {
                    email = val
                  });
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                obscureText: true,
                onChanged: (val){
                  setState(() => {
                    password= val
                  });
                },
              ),
              SizedBox(height: 20.0,),
              ElevatedButton(
                  onPressed: () async{
                    print('email = $email');
                    print('password = $password');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink[400],
                  ),
                  child: Text(
                      'Sign in',
                  style: TextStyle(
                    color: Colors.white,
                  ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
