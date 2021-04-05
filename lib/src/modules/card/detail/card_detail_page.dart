import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pocket_modular/src/components/molecules/cardInfo/cardInfo_widget.dart';
import 'package:pocket_modular/src/components/molecules/foreignNamesListItem/foreignNamesListItem_widget.dart';
import 'package:pocket_modular/src/modules/card/detail/card_detail_controller.dart';
import 'package:pocket_modular/src/shared/theme/color_theme.dart';

class CardDetailPage extends StatefulWidget {
  CardDetailPage({Key key, this.cardId}) : super(key: key);
  final String cardId;

  @override
  _CardDetailPageState createState() => _CardDetailPageState();
}

class _CardDetailPageState
    extends ModularState<CardDetailPage, CardDetailController> {
  loadData() async {
    try {
      await controller.getCardById(widget.cardId);
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    this.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorTheme.instance.element,
          title: Text('Detalhes'),
          elevation: 0.0,
        ),
        body: Observer(builder: (_) {
          return Stack(
            children: [
              Container(
                color: ColorTheme.instance.element,
              ),
              if (controller.isLoading)
                SpinKitRotatingCircle(
                  color: Colors.white,
                  size: 50.0,
                )
              else
                ListView(children: [
                  Column(children: [
                    CardInfoWidget(
                      item: controller.card,
                      isBackgroundColorWhite: false,
                    ),
                    Container(
                      height: 500,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.card.foreignNames.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ForeignNameListItemWidget(
                              item: controller.card.foreignNames[index],
                              isBackgroundColorWhite: true,
                            );
                          }),
                    ),
                  ]),
                ]),
            ],
          );
        }));
  }
}
