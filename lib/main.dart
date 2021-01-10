import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:teste_ambar/data/api.dart';
import 'package:teste_ambar/state/git_repo_store.dart';
import 'package:teste_ambar/widgets/custom_loading_widget.dart';
import 'package:teste_ambar/data/model/git_repository.dart';
import 'package:teste_ambar/widgets/repocard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Provider(
        child: MyHomePage(),
        create: (context) => GitRepoStore(Api()),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GitRepoStore _gitRepoStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _gitRepoStore ??= Provider.of<GitRepoStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfffffffc),
        appBar: AppBar(
          title: Text('Teste Ambar'),
          centerTitle: true,
          backgroundColor: Color(0xff0d1821),
        ),
        body: Observer(builder: (_) {
          if (_gitRepoStore.errorMessage != null) {
            return buildError(_gitRepoStore.errorMessage);
          }

          switch (_gitRepoStore.state) {
            case StoreState.initial:
              return buildLoading();
            case StoreState.loading:
              return buildLoading();
            case StoreState.loaded:
              return buildList(_gitRepoStore.reps);
          }
        }));
  }

  Center buildError(String errorMessage) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            errorMessage,
            style: TextStyle(fontSize: 20),
          ),
          RaisedButton(
            elevation: 10,
            color: Color(0xff9bf6ff),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onPressed: () {
              _gitRepoStore.getList();
            },
            child: Text(
              'Tentar novamente',
              style: TextStyle(fontSize: 15),
            ),
          )
        ],
      ),
    );
  }

  Center buildLoading() {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        alignment: Alignment.center,
        child: CustomLoadingWidget(),
      ),
    );
  }

  Widget buildList(List<GitRepo> reps) {
    return ListView.builder(
      itemCount: reps.length,
      itemBuilder: (context, index) => RepoCard(
        avatar: reps[index].avatar,
        name: reps[index].name,
        owner: reps[index].owner,
        repUrl: reps[index].repUrl,
      ),
    );
  }
}
