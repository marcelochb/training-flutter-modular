import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pocket_modular/src/store/auth/auth_store.dart';
import 'package:pocket_modular/src/store/user/user_store.dart';
part 'signup_controller.g.dart';

class SignUpController = _SignUpControllerBase with _$SignUpController;

abstract class _SignUpControllerBase with Store {
  final AuthStore _authStore;
  _SignUpControllerBase(this._authStore);

  final UserStore user = Modular.get();

  signUp() async {
    await _authStore.signUp();
    Modular.to.pushReplacementNamed('/CardListPage');
  }
}
