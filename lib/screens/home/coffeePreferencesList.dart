import 'package:coffee_app/models/coffee.dart';
import 'package:coffee_app/screens/home/coffee_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoffeePreferencesList extends StatefulWidget {
  const CoffeePreferencesList({Key? key}) : super(key: key);

  @override
  State<CoffeePreferencesList> createState() => _CoffeePreferencesListState();
}

class _CoffeePreferencesListState extends State<CoffeePreferencesList> {
  @override
  Widget build(BuildContext context) {

    final coffee = Provider.of<List<Coffee>>(context);

     return coffee != null ? ListView.builder(
        itemCount: coffee.length,
        itemBuilder: (context,index){
          return CoffeeTile(coffee: coffee[index]);
        })
     : Container()
     ;
  }
}

