import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';

class GoogleSignInService {
  static Future<UserCredential?> signInWithGoogle() async {
    try {
      // -------------------------------------------
      //            تسجيل الدخول على الويب
      // -------------------------------------------
      if (kIsWeb) {
        GoogleAuthProvider authProvider = GoogleAuthProvider();

        authProvider.addScope('email');
        authProvider.setCustomParameters({'prompt': 'select_account'});

        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithPopup(authProvider);

        return userCredential;
      }

      // -------------------------------------------
      //        تسجيل الدخول على Android / iOS
      // -------------------------------------------
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print("Google Sign-In Error: $e");
      return null;
    }
  }
}
