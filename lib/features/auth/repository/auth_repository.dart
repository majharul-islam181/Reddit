// ignore_for_file: avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reddit/core/providers/firebase_providers.dart';



final authRepositoryProvider = Provider((ref)=> AuthRepository(firestore: ref.read(firestoreProvider), auth: ref.read(authProvider), googlesignin: ref.read(googleSignInProvider)));
class AuthRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth; // firebase Authentication
  final GoogleSignIn _googleSignIn;  // signinwith google ui

  AuthRepository(
      {required FirebaseFirestore firestore,
      required FirebaseAuth auth,
      required GoogleSignIn googlesignin})
      : _auth = auth,
        _firestore = firestore,
        _googleSignIn = googlesignin;

  void signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential = await _auth.signInWithCredential(credential);
      print(userCredential.user?.email);
    } catch (e) {
      print(e);
    }
  }
}
