import 'package:coffee_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _userFromFirebaseUser(FirebaseUser user){
    return user !=  null ? User(uid: user.uid) : null;
  }

  Stream<User?> get user{
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  Future SignInAnon () async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
     return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
}