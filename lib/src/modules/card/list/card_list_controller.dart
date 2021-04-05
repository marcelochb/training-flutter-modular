import 'package:mobx/mobx.dart';
import 'package:pocket_modular/src/modules/card/card_repository.dart';

import '../card_model.dart';
part 'card_list_controller.g.dart';

class CardListController = _CardListControllerBase with _$CardListController;

abstract class _CardListControllerBase with Store {
  final CardRepository cardRepository;

  _CardListControllerBase(this.cardRepository);

  @observable
  ObservableList<ModelOfCard> cards = <ModelOfCard>[].asObservable();

  @observable
  bool isLoading = true;

  int _currentCardListPage = 1;

  @observable
  bool isLoadingCardListItem = false;

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
}
