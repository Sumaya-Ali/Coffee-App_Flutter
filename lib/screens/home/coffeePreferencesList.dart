import 'package:cloud_firestore/cloud_firestore.dart';
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

    final coffee = Provider.of<QuerySnapshot>(context);
    for(var doc in coffee.documents){
      print(doc.data);
    }
    return Container();
  }
}

