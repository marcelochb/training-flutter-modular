import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepositoryInterface {
  Future currentLoggedUser();
  Future<UserCredential> signIn({String email, String password});
  Future<UserCredential> signUp({String email, String password});
  Future signOut();
  Future<String> getToken({UserCredential signInResponse});
  Future<String> getDatabaseUser({UserCredential signInResponse});
  Future<bool> createDatabaseUser({String email, String name, String uid});
}
