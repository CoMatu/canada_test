import 'package:flutter/material.dart';
import 'package:hello_canada/domain/entities/repo.dart';

class RepoProvider extends ChangeNotifier {
  List<Repo> _repoList = [];
  List<Repo> get reposList => _repoList;

  void setReposSearchResult(List<Repo> repos) {
    _repoList = repos;
    notifyListeners();
  }

  void addRepo(Repo repo) {
    _repoList.add(repo);
    notifyListeners();
  }

  void clearList() {
    _repoList = [];
    notifyListeners();
  }

  void updateRepo(Repo repo) {
    _repoList.where((element) =>
        element.hashCode == repo.hashCode ? _repoList.remove(element) : null);
    _repoList.add(repo);
    notifyListeners();
  }
}
