import 'package:flutter/material.dart';
import 'package:teste_ambar/api.dart';
import 'package:teste_ambar/custom_loading_widget.dart';
import 'package:teste_ambar/git_repository.dart';
import 'package:teste_ambar/repocard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

Api api = Api();
List<GitRepository> reps = [];

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffffffc),
      appBar: AppBar(
        title: Text('Teste Ambar'),
        centerTitle: true,
        backgroundColor: Color(0xff0d1821),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Container(
                  width: 200,
                  height: 200,
                  alignment: Alignment.center,
                  child: CustomLoadingWidget(),
                ),
              );
            default:
              if (snapshot.hasError)
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Houve um erro na comunicação.',
                        style: TextStyle(fontSize: 20),
                      ),
                      RaisedButton(
                        elevation: 10,
                        color: Color(0xff9bf6ff),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        onPressed: () {
                          setState(() {});
                        },
                        child: Text(
                          'Tentar novamente',
                          style: TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  ),
                );
              else
                return buildList(snapshot.data);
          }
        },
        future: api.getList(),
      ),
    );
  }

  Widget buildList(List<GitRepository> reps) {
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
