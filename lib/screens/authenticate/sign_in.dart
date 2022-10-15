import 'package:coffee_app/services/auth.dart';
import 'package:coffee_app/shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coffee_app/shared/constant.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email ='';
  String password ='';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {

    return loading? Loading() :  Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: Text('Sign in to Coffee App'),
        actions: [
          TextButton.icon(
              onPressed: (){
                widget.toggleView();
              },
              icon: Icon(
                  Icons.person,
                  color: Colors.white,
              ),
              label: Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                ),
              ))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: inputFormDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                onChanged: (val){
                  setState(() => {
                    email = val
                  });
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: inputFormDecoration.copyWith(hintText: 'Password'),
                validator: (val) => val!.length <6 ? 'Enter password 6+ characters long' : null,
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
                    if(_formKey.currentState!.validate()){
                      setState(() {
                        loading = true;
                      });
                      dynamic user = await _auth.SignInWithEmailAndPassword(email, password);
                      if (user == null){
                        setState(() {
                          error = 'could not sign in for those credentials';
                          loading= false;
                        });
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink[400],
                  ),
                  child: Text(
                      'Sign in',
                  style: TextStyle(
                    color: Colors.white,
                  ),),
              ),
              SizedBox(height: 12.0,),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
