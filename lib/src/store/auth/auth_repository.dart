import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth_repository_interface.dart';

class AuthRepository implements AuthRepositoryInterface {
  @override
  Future currentLoggedUser() async {
    return FirebaseAuth.instance.currentUser;
  }

  @override
  Future<UserCredential> signIn(
      {@required String email, @required String password}) async {
    UserCredential signInResponse;
    try {
      signInResponse = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {}
    return signInResponse;
  }

  @override
  Future signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {}
  }

  @override
  Future<UserCredential> signUp(
      {@required String email, @required String password}) async {
    UserCredential signUpResponse;
    try {
      signUpResponse = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {}
    return signUpResponse;
  }

  @override
  Future<String> getToken({@required UserCredential signInResponse}) async {
    String tokenResponse;
    try {
      tokenResponse = await signInResponse.user.getIdToken();
    } catch (e) {}
    return tokenResponse;
  }

  @override
  Future<String> getDatabaseUser(
      {@required UserCredential signInResponse}) async {
    String userName;
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(signInResponse.user.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) async {
        if (documentSnapshot.exists) {
          print('retorno database ${documentSnapshot.data()}');
        }
      });
    } catch (e) {}
    return userName;
  }

  @override
  Future<bool> createDatabaseUser(
      {@required String name,
      @required String email,
      @required String uid}) async {
    bool isUserCreated = false;
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .set({'name': name, 'email': email, 'uid': uid}).then(
              (_) => isUserCreated = true);
    } catch (e) {}

    return isUserCreated;
  }
}
