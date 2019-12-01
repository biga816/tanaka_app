// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'works_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WorksStore on _WorksStore, Store {
  final _$worksAtom = Atom(name: '_WorksStore.works');

  @override
  ObservableList<Work> get works {
    _$worksAtom.context.enforceReadPolicy(_$worksAtom);
    _$worksAtom.reportObserved();
    return super.works;
  }

  @override
  set works(ObservableList<Work> value) {
    _$worksAtom.context.conditionallyRunInAction(() {
      super.works = value;
      _$worksAtom.reportChanged();
    }, _$worksAtom, name: '${_$worksAtom.name}_set');
  }

  final _$pageAtom = Atom(name: '_WorksStore.page');

  @override
  int get page {
    _$pageAtom.context.enforceReadPolicy(_$pageAtom);
    _$pageAtom.reportObserved();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.context.conditionallyRunInAction(() {
      super.page = value;
      _$pageAtom.reportChanged();
    }, _$pageAtom, name: '${_$pageAtom.name}_set');
  }

  final _$successAtom = Atom(name: '_WorksStore.success');

  @override
  bool get success {
    _$successAtom.context.enforceReadPolicy(_$successAtom);
    _$successAtom.reportObserved();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.context.conditionallyRunInAction(() {
      super.success = value;
      _$successAtom.reportChanged();
    }, _$successAtom, name: '${_$successAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_WorksStore.loading');

  @override
  bool get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  final _$fetchWorksAsyncAction = AsyncAction('fetchWorks');

  @override
  Future fetchWorks(int page) {
    return _$fetchWorksAsyncAction.run(() => super.fetchWorks(page));
  }
}
