import 'package:mobx/mobx.dart';
import 'package:pocket_modular/src/modules/card/card_model.dart';
import 'package:pocket_modular/src/modules/card/card_repository.dart';
part 'card_detail_controller.g.dart';

class CardDetailController = _CardDetailControllerBase
    with _$CardDetailController;

abstract class _CardDetailControllerBase with Store {
  final CardRepository cardRepository;
  _CardDetailControllerBase(this.cardRepository);

  @observable
  ModelOfCard card;

  @observable
  bool isLoading = true;

  @action
  getCardById(String _id) async {
    card = await cardRepository.fetchCardById(_id);
    isLoading = false;
  }
}
