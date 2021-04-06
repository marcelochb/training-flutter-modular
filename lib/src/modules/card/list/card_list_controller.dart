import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pocket_modular/src/modules/card/card_repository.dart';
import 'package:pocket_modular/src/store/auth/auth_store.dart';
import 'package:pocket_modular/src/store/user/user_store.dart';

import '../card_model.dart';
part 'card_list_controller.g.dart';

class CardListController = _CardListControllerBase with _$CardListController;

abstract class _CardListControllerBase with Store {
  final CardRepository cardRepository;
  final AuthStore _auth = Modular.get();
  final UserStore user = Modular.get();

  @observable
  ObservableList<ModelOfCard> cards = <ModelOfCard>[].asObservable();

  @observable
  bool isLoading = true;

  int _currentCardListPage = 1;

  @observable
  bool isLoadingCardListItem = false;

  signOut() async {
    await _auth.signOut();
    Modular.to.pushReplacementNamed('/SignIn');
  }

  @action
  getCards() async {
    if (_currentCardListPage > 1) isLoadingCardListItem = true;

    List<ModelOfCard> _cardListFormApi =
        await cardRepository.fetchCards(initialPage: _currentCardListPage);
    _currentCardListPage++;
    ObservableList<ModelOfCard> _cardListAsObservable =
        _cardListFormApi.asObservable();
    for (var item in _cardListAsObservable) {
      cards.add(item);
    }
    isLoading = false;
    isLoadingCardListItem = false;
  }

  _CardListControllerBase(this.cardRepository) {
    getCards();
  }
}
