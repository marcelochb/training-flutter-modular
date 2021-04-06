import 'package:flutter_modular/flutter_modular.dart';

import 'detail/card_detail_page.dart';
import 'list/card_list_page.dart';

class CardModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/CardListPage', child: (_, args) => CardListPage()),
    ChildRoute('/CardDetailPage/:cardId',
        child: (_, args) => CardDetailPage(
              cardId: args.params['cardId'],
            )),
  ];
}
