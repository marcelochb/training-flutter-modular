// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStoreBase, Store {
  final _$signedAtom = Atom(name: '_AuthStoreBase.signed');

  @override
  bool get signed {
    _$signedAtom.reportRead();
    return super.signed;
  }

  @override
  set signed(bool value) {
    _$signedAtom.reportWrite(value, super.signed, () {
      super.signed = value;
    });
  }

  final _$signInAsyncAction = AsyncAction('_AuthStoreBase.signIn');

  @override
  Future signIn() {
    return _$signInAsyncAction.run(() => super.signIn());
  }

  final _$signOutAsyncAction = AsyncAction('_AuthStoreBase.signOut');

  @override
  Future signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  final _$signUpAsyncAction = AsyncAction('_AuthStoreBase.signUp');

  @override
  Future signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

  @override
  String toString() {
    return '''
signed: ${signed}
    ''';
  }
}
