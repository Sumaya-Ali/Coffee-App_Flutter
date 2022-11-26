import 'package:coffee_app/shared/constant.dart';
import 'package:flutter/material.dart';

class SettinsForm extends StatefulWidget {
  const SettinsForm({Key? key}) : super(key: key);

  @override
  State<SettinsForm> createState() => _SettinsFormState();
}

class _SettinsFormState extends State<SettinsForm> {

  final _formkey = GlobalKey<FormState>();
  final List<String> sugars = ['0','1','2','3'];

  String _currentName ='';
  String _currentSugar ='0';
  int _currentStrength =100;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          Text(
            'Update your coffee settings.',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          SizedBox(height: 20.0,),
          TextFormField(
            decoration: inputFormDecoration,
            validator: (val) => val!.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => setState(
                () =>{
                  _currentName=val,
                }
            ),
          ),
          SizedBox(height: 20.0,),
          DropdownButtonFormField(
              decoration: inputFormDecoration,
              value: _currentSugar ,
              items: sugars.map((sugar){
                return DropdownMenuItem(
                    value: sugar,
                    child: Text(
                      ' $sugar sugars',
                    ));
              }).toList(),
              onChanged: (val)=> setState(
                  () => {
                    _currentSugar = val.toString(),
                  }
              ),
          ),
          SizedBox(height: 20.0,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.pink[400],
              ),
              onPressed: () async{
                print(_currentName);
                print(_currentSugar);
                print(_currentStrength);
              },
              child: Text(
                'Update',
                style: TextStyle(
                  color: Colors.white,
                ),
              ))
        ],
      ),
    );
  }
}
