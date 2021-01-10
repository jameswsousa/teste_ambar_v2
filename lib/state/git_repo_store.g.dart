// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'git_repo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GitRepoStore on _GitRepoStore, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$_repsFutureAtom = Atom(name: '_GitRepoStore._repsFuture');

  @override
  ObservableFuture<List<GitRepo>> get _repsFuture {
    _$_repsFutureAtom.context.enforceReadPolicy(_$_repsFutureAtom);
    _$_repsFutureAtom.reportObserved();
    return super._repsFuture;
  }

  @override
  set _repsFuture(ObservableFuture<List<GitRepo>> value) {
    _$_repsFutureAtom.context.conditionallyRunInAction(() {
      super._repsFuture = value;
      _$_repsFutureAtom.reportChanged();
    }, _$_repsFutureAtom, name: '${_$_repsFutureAtom.name}_set');
  }

  final _$repsAtom = Atom(name: '_GitRepoStore.reps');

  @override
  List<GitRepo> get reps {
    _$repsAtom.context.enforceReadPolicy(_$repsAtom);
    _$repsAtom.reportObserved();
    return super.reps;
  }

  @override
  set reps(List<GitRepo> value) {
    _$repsAtom.context.conditionallyRunInAction(() {
      super.reps = value;
      _$repsAtom.reportChanged();
    }, _$repsAtom, name: '${_$repsAtom.name}_set');
  }

  final _$errorMessageAtom = Atom(name: '_GitRepoStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.context.enforceReadPolicy(_$errorMessageAtom);
    _$errorMessageAtom.reportObserved();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.context.conditionallyRunInAction(() {
      super.errorMessage = value;
      _$errorMessageAtom.reportChanged();
    }, _$errorMessageAtom, name: '${_$errorMessageAtom.name}_set');
  }

  final _$getListAsyncAction = AsyncAction('getList');

  @override
  Future getList() {
    return _$getListAsyncAction.run(() => super.getList());
  }
}
