import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends Disposable {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin fbLogin = FacebookLogin();
  FirebaseUser currentUser;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<bool> signFacebook() async {
    try {
      final result = await fbLogin.logIn(['email']);
      final token = result.accessToken.token;
      AuthCredential credential =
          FacebookAuthProvider.getCredential(accessToken: token);
      FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> signGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final FirebaseUser user =
          (await _auth.signInWithCredential(credential)).user;
      return true;
    } catch (e) { 
      return false;
    }
  }

  Future<bool> signEmailPass(String email, String pass) async {
    try {
      final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      ))
          .user;
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  void dispose() {}
}
