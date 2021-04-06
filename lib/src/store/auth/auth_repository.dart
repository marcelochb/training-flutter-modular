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
    final signInResponse = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return signInResponse;
  }

  @override
  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<UserCredential> signUp(
      {@required String email, @required String password}) async {
    final signUpResponse = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    print('signuprespont $signUpResponse');
    return signUpResponse;
  }

  @override
  Future<String> getToken({@required UserCredential signInResponse}) async {
    final tokenResponse = await signInResponse.user.getIdToken();
    return tokenResponse;
  }

  @override
  Future<String> getDatabaseUser(
      {@required UserCredential signInResponse}) async {
    final response = await FirebaseFirestore.instance
        .collection('users')
        .doc(signInResponse.user.uid)
        .get();
    print('response $response');
    return response.data()['name'];
  }

  @override
  Future createDatabaseUser(
      {@required String name,
      @required String email,
      @required String uid}) async {
    bool isUserCreated = false;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set({'name': name, 'email': email, 'uid': uid}).then(
            (_) => isUserCreated = true);

    print('isUserCreated $isUserCreated');
    return isUserCreated;
  }
}
