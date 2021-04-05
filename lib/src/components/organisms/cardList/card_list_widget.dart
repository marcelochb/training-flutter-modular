import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pocket_modular/src/components/molecules/cardListItem/cardListItm_widget.dart';
import 'package:pocket_modular/src/modules/card/list/card_list_controller.dart';
import 'package:pocket_modular/src/shared/theme/color_theme.dart';

class CardListWidget extends StatefulWidget {
  @override
  _CardListWidgetState createState() => _CardListWidgetState();
}

class _CardListWidgetState
    extends ModularState<CardListWidget, CardListController> {
  final ScrollController _scrollController = new ScrollController();

  loadData() async {
    try {
      await controller.getCards();
    } catch (e) {}
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        this.loadData();
      }
    });
    super.initState();
  }

  disposed() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (controller.isLoading)
        return SpinKitRotatingCircle(
          color: ColorTheme.instance.element,
          size: 50.0,
        );
      return Stack(
        children: [
          ListView.builder(
              itemCount: controller.cards.length,
              controller: _scrollController,
              addAutomaticKeepAlives: false,
              dragStartBehavior: DragStartBehavior.down,
              itemBuilder: (context, index) {
                return CardListItemWidget(
                  item: controller.cards[index],
                );
              }),
          if (controller.isLoadingCardListItem)
            Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SpinKitHourGlass(
                  color: ColorTheme.instance.background,
                  size: 50.0,
                ),
              ],
            )),
        ],
      );
    });
  }
}
