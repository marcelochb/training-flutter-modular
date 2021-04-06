import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pocket_modular/src/store/auth/auth_repository_interface.dart';
import 'package:pocket_modular/src/store/local_storage/local_storage_interface.dart';
import 'package:pocket_modular/src/store/user/user_store.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final AuthRepositoryInterface _authRepository;

  final UserStore user = Modular.get();
  final LocalStorageInterface _localStorage = Modular.get();
  _init() async {
    try {
      await Firebase.initializeApp();
    } catch (e) {}
  }

  _AuthStoreBase(this._authRepository) {
    _init();
  }

  @observable
  bool signed = false;

  @action
  signIn() async {
    final UserCredential signInResponse = await _authRepository.signIn(
        email: user.email, password: user.password);

    final userName =
        await _authRepository.getDatabaseUser(signInResponse: signInResponse);

    user.changeName(userName);

    signed = true;
    _localStorage.saveBoolean('signed', true);
    _localStorage.saveString('name', userName);
    _localStorage.saveString('email', user.email);
  }

  @action
  signOut() async {
    await _authRepository.signOut();
    signed = false;
    _localStorage.delete('signed');
    _localStorage.delete('name');
    _localStorage.delete('email');
  }

  @action
  signUp() async {
    final UserCredential signUpresponse = await _authRepository.signUp(
        email: user.email, password: user.password);

    await _authRepository.createDatabaseUser(
        email: user.email, name: user.name, uid: signUpresponse.user.uid);

    signed = true;
    _localStorage.saveBoolean('signed', true);
    _localStorage.saveString('name', user.name);
    _localStorage.saveString('email', user.email);
  }
}
