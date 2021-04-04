import 'package:flutter_modular/flutter_modular.dart';
import 'package:pocket_modular/src/modules/card/list/card_list_page.dart';

class CardListModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => CardListPage()),
  ];
}
