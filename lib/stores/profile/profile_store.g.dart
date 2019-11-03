// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileStore on _ProfileStore, Store {
  final _$profileAtom = Atom(name: '_ProfileStore.profile');

  @override
  Profile get profile {
    _$profileAtom.context.enforceReadPolicy(_$profileAtom);
    _$profileAtom.reportObserved();
    return super.profile;
  }

  @override
  set profile(Profile value) {
    _$profileAtom.context.conditionallyRunInAction(() {
      super.profile = value;
      _$profileAtom.reportChanged();
    }, _$profileAtom, name: '${_$profileAtom.name}_set');
  }

  final _$fetchProfileAsyncAction = AsyncAction('fetchProfile');

  @override
  Future fetchProfile(int id) {
    return _$fetchProfileAsyncAction.run(() => super.fetchProfile(id));
  }
}
