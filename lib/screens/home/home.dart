import 'package:coffee_app/models/coffee.dart';
import 'package:coffee_app/screens/home/coffeePreferencesList.dart';
import 'package:coffee_app/services/auth.dart';
import 'package:coffee_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return StreamProvider<List<Coffee>?>.value(
      initialData: null,
      value: DatabaseService(uid: '').coffeePreferences,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Coffee App'),
          backgroundColor: Colors.brown[400],
          elevation: 0,
          actions: [
            TextButton.icon(
              onPressed: () async{
                await _auth.signOut();
              },
              icon: Icon(
                  Icons.person,
                  color: Colors.white,
              ),
              label: Text(
                  'logout',
                  style: TextStyle(
                    color: Colors.white,
                  ),
              ),
            ),
          ],
        ),
        body: CoffeePreferencesList(),
      ),
    );
  }
}
