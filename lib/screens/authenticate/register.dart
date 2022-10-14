import 'package:coffee_app/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
        title: Text('Sign up to Coffee App'),
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
                'Sign in',
                style: TextStyle(
                  color: Colors.white,
                ),
              ))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 20.0,),
              TextFormField(
                onChanged: (val){
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                obscureText: true,
                onChanged: (val){
                  setState(() {
                    password= val;
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
                  'Register',
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
