import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pocket_modular/src/modules/card/card_repository.dart';
import 'package:pocket_modular/src/modules/card/list/card_list_controller.dart';
import 'package:pocket_modular/src/modules/card/list/card_lst_module.dart';
import 'package:pocket_modular/src/shared/utils/constants.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => CardListController(i.get<CardRepository>())),
    Bind((i) => CardRepository(i.get<Dio>())),
    Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: CardListModule()),
  ];
}
