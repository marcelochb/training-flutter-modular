import 'package:mobx/mobx.dart';
part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  @observable
  String name;

  @observable
  String email;

  @observable
  String password;

  @action
  changeEmail(String value) => email = value;

  @action
  changePassword(String value) => password = value;

  @action
  changeName(String value) => name = value;
}
