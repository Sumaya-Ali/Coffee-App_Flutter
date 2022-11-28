import 'package:coffee_app/models/user.dart';
import 'package:coffee_app/services/database.dart';
import 'package:coffee_app/shared/constant.dart';
import 'package:coffee_app/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettinsForm extends StatefulWidget {
  const SettinsForm({Key? key}) : super(key: key);

  @override
  State<SettinsForm> createState() => _SettinsFormState();
}

class _SettinsFormState extends State<SettinsForm> {

  final _formkey = GlobalKey<FormState>();
  final List<String> sugars = ['0','1','2','3'];

  String? _currentName;
  String? _currentSugar;
  int? _currentStrength;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          UserData? userData = snapshot.data;

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
                  initialValue: userData!.name,
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
                  value: _currentSugar ?? userData.sugars ,
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
                Slider(
                  min: 100.0,
                  max: 900.0,
                  divisions: 8,
                  onChanged: (val) => {
                    setState(
                            () =>{
                          _currentStrength = val.round(),
                        })},
                  value: (_currentStrength ?? userData.strength).toDouble(),
                  activeColor: Colors.brown[_currentStrength ?? userData.strength],
                  inactiveColor: Colors.brown[_currentStrength ?? userData.strength],
                ),
                SizedBox(height: 20.0,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink[400],
                    ),
                    onPressed: () async{
                      if(_formkey.currentState!.validate()){
                        await DatabaseService(uid: user.uid).updateUserData(
                            _currentSugar ?? userData.sugars,
                            _currentName ?? userData.name,
                            _currentStrength ?? userData.strength,
                        );
                        Navigator.pop(context);
                      }
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
        }else{
          return Loading();
        }
      }
    );
  }
}
