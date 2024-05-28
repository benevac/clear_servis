import 'package:flutter/material.dart';

void main() {
  var path = '/Users/aleksandrvaliyev/Documents/Clear_Servis/clear_servis/lib/providers/auth_provider.dart';
  var fileUri = Uri.file(path);
  print(fileUri);
}

class AuthProvider with ChangeNotifier {

  String? _userId;

  String? get userId => _userId;


  // Метод выхода можно оставить, убрав вызов signOut у FirebaseAuth
  Future<void> logout() async {
    // await _auth.signOut();
    _userId = null;
    notifyListeners();
  }
}


/*
import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:firebase_auth/firebase_auth.dart';

void main() {
  var path = '/Users/aleksandrvaliyev/Documents/Clear_Servis/clear_servis/lib/providers/auth_provider.dart';
  var fileUri = Uri.file(path);
  print(fileUri);
}

class AuthProvider with ChangeNotifier {

  //final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  User? get user => _user;
  String? get userId => _user?.uid;

  /*
  Future<User?> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );


      final UserCredential authResult = await _auth.signInWithCredential(credential);
      _user = authResult.user;
      notifyListeners();
      return _user;
    }
    return null;
  }

   */



  Future<void> logout() async {
    //await _auth.signOut();
    _user = null;
    notifyListeners();
  }
}

 */



