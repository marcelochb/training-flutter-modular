import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pocket_modular/src/components/organisms/cardList/card_list_widget.dart';
import 'package:pocket_modular/src/modules/card/list/card_list_controller.dart';
import 'package:pocket_modular/src/shared/theme/color_theme.dart';

class CardListPage extends StatefulWidget {
  @override
  _CardListPageState createState() => _CardListPageState();
}

class _CardListPageState
    extends ModularState<CardListPage, CardListController> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.instance.background,
        title: Observer(builder: (_) {
          return Text(
            controller.user.name,
            style: TextStyle(color: ColorTheme.instance.text),
          );
        }),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  controller.signOut();
                },
                child: Icon(
                  Icons.logout,
                  size: 26.0,
                ),
              )),
        ],
        leading: Container(
            margin: const EdgeInsets.only(left: 10),
            child: Image.asset('assets/images/logo.png')),
        leadingWidth: 100,
      ),
      body: CardListWidget(),
    );
  }
}
