import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pocket_modular/src/store/auth/auth_repository_interface.dart';
import 'package:pocket_modular/src/store/user/user_store.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final AuthRepositoryInterface _authRepository;

  final UserStore _user = Modular.get();

  _AuthStoreBase(this._authRepository);

  @observable
  bool signed = false;

  @action
  signIn() async {
    final UserCredential signInResponse = await _authRepository.signIn(
        email: _user.email, password: _user.password);

    final userName =
        await _authRepository.getDatabaseUser(signInResponse: signInResponse);

    _user.changeEmail(userName);

    signed = true;
  }

  @action
  signOut() async {
    await _authRepository.signOut();
    signed = false;
  }

  @action
  signUp() async {
    final UserCredential signUpresponse = await _authRepository.signUp(
        email: _user.email, password: _user.password);

    final isUserCreated = await _authRepository.createDatabaseUser(
        email: _user.email, name: _user.name, uid: signUpresponse.user.uid);

    if (isUserCreated) signed = true;
  }
}
