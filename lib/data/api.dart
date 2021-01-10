import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:teste_ambar/errors/exceptions.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

import 'model/git_repository.dart';

class Api {
  Future<List<GitRepo>> getList() async {
    if (await DataConnectionChecker().hasConnection) {
      http.Response response;
      List<GitRepo> repositories = [];
      response = await http.get('https://api.github.com/repositories');

      if (response.statusCode == 200) {
        json.decode(response.body).map((rep) {
          repositories.add(GitRepo.fromJson(rep));
        }).toList();
        return repositories;
      } else {
        throw DataException();
      }
    } else {
      throw NoInternetException();
    }
  }
}
