import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/models/coffee.dart';
import 'package:coffee_app/models/user.dart';

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

  Stream<List<Coffee>> get coffeePreferences {
    return coffeeCollection.snapshots().map(_coffeeListFromSnapshot);
  }

  List<Coffee> _coffeeListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc) {
      return Coffee(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        sugars: doc.data['sugars'] ?? '',
      );
    }).toList();
  }

  UserData _userDataFromSnapShot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      sugars: snapshot.data['sugars'],
      strength: snapshot.data['strength'],
    );
  }

  Stream<UserData> get userData {
    return coffeeCollection.document(uid).snapshots().map(_userDataFromSnapShot);
  }
}