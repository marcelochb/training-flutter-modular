// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CardDetailController on _CardDetailControllerBase, Store {
  final _$cardAtom = Atom(name: '_CardDetailControllerBase.card');

  @override
  ModelOfCard get card {
    _$cardAtom.reportRead();
    return super.card;
  }

  @override
  set card(ModelOfCard value) {
    _$cardAtom.reportWrite(value, super.card, () {
      super.card = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_CardDetailControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$getCardByIdAsyncAction =
      AsyncAction('_CardDetailControllerBase.getCardById');

  @override
  Future getCardById(String _id) {
    return _$getCardByIdAsyncAction.run(() => super.getCardById(_id));
  }

  @override
  String toString() {
    return '''
card: ${card},
isLoading: ${isLoading}
    ''';
  }
}
