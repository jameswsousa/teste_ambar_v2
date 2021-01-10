import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:teste_ambar/git_repository.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

class Api {
  Future<List<GitRepository>> getList() async {
    if (await DataConnectionChecker().hasConnection) {
      http.Response response;
      List<GitRepository> repositories = [];
      response = await http.get('https://api.github.com/repositories');
      if (response.statusCode == 200) {
        json.decode(response.body).map((rep) {
          repositories.add(GitRepository.fromJson(rep));
        }).toList();
        return repositories;
      } else {
        throw Exception('Erro ao carregar dados');
      }
    } else {
      throw Exception('Você não está conectado à internet');
    }
  }
}
