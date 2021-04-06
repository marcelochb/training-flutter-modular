import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pocket_modular/src/modules/signin/signin_controller.dart';
import 'package:pocket_modular/src/modules/signin/signin_page.dart';
import 'package:pocket_modular/src/modules/signup/signup_controller.dart';
import 'package:pocket_modular/src/modules/signup/signup_page.dart';
import 'package:pocket_modular/src/modules/splash/splash_controller.dart';
import 'package:pocket_modular/src/modules/splash/splash_page.dart';
import 'package:pocket_modular/src/shared/utils/constants.dart';
import 'package:pocket_modular/src/store/auth/auth_store.dart';
import 'package:pocket_modular/src/store/auth/auth_repository.dart';
import 'package:pocket_modular/src/store/auth/auth_repository_interface.dart';
import 'package:pocket_modular/src/store/local_storage/local_storage_shared_preference.dart';
import 'package:pocket_modular/src/store/user/user_store.dart';

import 'modules/card/card_module.dart';
import 'modules/card/card_repository.dart';
import 'modules/card/detail/card_detail_controller.dart';
import 'modules/card/list/card_list_controller.dart';
import 'store/local_storage/local_storage_hive.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => CardListController(i.get<CardRepository>())),
    Bind((i) => CardDetailController(i.get<CardRepository>())),
    Bind((i) => CardRepository(i.get<Dio>())),
    Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
    Bind((i) => SignInController(i.get<AuthStore>())),
    Bind((i) => SignUpController(i.get<AuthStore>())),
    Bind((i) => AuthStore(i.get<AuthRepositoryInterface>())),
    Bind((i) => SplashController(i.get<UserStore>())),
    Bind((i) => AuthRepository()),
    Bind((i) => UserStore()),
    // Bind((i) => LocalStorageHive()),
    Bind((i) => LocalStorageSharedPreference()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SplashPage()),
    ChildRoute('/SignIn', child: (_, args) => SignInPage()),
    ChildRoute('/SignUp', child: (_, args) => SignUpPage()),
    ModuleRoute('/CardListPage', module: CardModule()),
  ];
}
