import 'package:mobx/mobx.dart';
import 'package:teste_ambar/data/api.dart';
import 'package:teste_ambar/data/model/git_repository.dart';
import 'package:teste_ambar/errors/exceptions.dart';

part 'git_repo_store.g.dart';

class GitRepoStore extends _GitRepoStore with _$GitRepoStore {
  GitRepoStore(Api api) : super(api);
}

enum StoreState { initial, loading, loaded }

abstract class _GitRepoStore with Store {
  final Api _api;
  _GitRepoStore(this._api) {
    getList();
  }

  @observable
  ObservableFuture<List<GitRepo>> _repsFuture;

  @observable
  List<GitRepo> reps;

  @observable
  String errorMessage;

  @computed
  StoreState get state {
    if (_repsFuture == null || _repsFuture.status == FutureStatus.rejected) {
      return StoreState.initial;
    }

    return _repsFuture.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @action
  Future getList() async {
    try {
      errorMessage = null;
      _repsFuture = ObservableFuture(_api.getList());
      reps = await _repsFuture;
    } on NoInternetException {
      errorMessage = 'Verifique sua conexão com a internet';
    } on DataException {
      errorMessage = 'Erro ao obter dados';
    } catch (e) {
      errorMessage = 'Houve um erro de comunicação';
    }
  }
}
