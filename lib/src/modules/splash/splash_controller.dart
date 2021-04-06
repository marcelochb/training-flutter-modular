import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pocket_modular/src/store/local_storage/local_storage_interface.dart';
import 'package:pocket_modular/src/store/user/user_store.dart';
part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  final UserStore user;
  final LocalStorageInterface _localStorage = Modular.get();

  _SplashControllerBase(this.user) {
    _init();
  }

  @action
  _init() async {
    String name = await _localStorage.getString('name');
    bool signed = await _localStorage.getBoolean('signed') ?? false;
    String email = await _localStorage.getString('email');

    if (name != null && email != null && signed) {
      user.changeEmail(email);
      user.changeName(name);

      Modular.to.pushReplacementNamed('/CardListPage');
    } else
      Modular.to.pushReplacementNamed('/SignIn');
  }
}
