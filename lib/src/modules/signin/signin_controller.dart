import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pocket_modular/src/store/auth/auth_store.dart';
import 'package:pocket_modular/src/store/user/user_store.dart';
part 'signin_controller.g.dart';

class SignInController = _SignInControllerBase with _$SignInController;

abstract class _SignInControllerBase with Store {
  final AuthStore auth;
  _SignInControllerBase(this.auth);

  final UserStore user = Modular.get();

  signIn() async {
    await auth.signIn();
    Modular.to.pushReplacementNamed('/CardListPage');
  }
}
