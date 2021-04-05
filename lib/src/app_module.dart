import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pocket_modular/src/shared/utils/constants.dart';

import 'modules/card/card_module.dart';
import 'modules/card/card_repository.dart';
import 'modules/card/detail/card_detail_controller.dart';
import 'modules/card/list/card_list_controller.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => CardListController(i.get<CardRepository>())),
    Bind((i) => CardDetailController(i.get<CardRepository>())),
    Bind((i) => CardRepository(i.get<Dio>())),
    Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: CardModule()),
  ];
}
