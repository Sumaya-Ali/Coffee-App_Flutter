import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({ required this.uid});

  final CollectionReference coffeeCollection = Firestore.instance.collection('coffee');

  Future updateUserData(String sugars, String name, int strength) async{
    return await coffeeCollection.document(uid).setData({
      'sugars' : sugars,
      'name' : name,
      'strength': strength,
    });
  }
}