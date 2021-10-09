import 'package:firebase_auth/firebase_auth.dart';
import 'package:quick_pc/models/users.dart';

class AuthService {

  // Instance of Firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on firebase user
  PCUser _useFromFirebaseUser(User user) {
    // return user id if it exists, if not return null
    return user != null ? PCUser(uid: user.uid) : null;
  }

  // auth change user stream
  // whenever a change in authentication return state changed
  // Every time we get a fire base user we map it to our User class
  Stream<PCUser> get user {
    return _auth.authStateChanges()
        .map(_useFromFirebaseUser);
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _useFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }

  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _useFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _useFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future resetPass(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

}