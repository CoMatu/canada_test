import 'package:flutter/material.dart';
import 'package:hello_canada/domain/entities/git_hub_user.dart';

class UserProvider extends ChangeNotifier {
  GitHubUser _user;
  List<GitHubUser> _usersList = [];

  GitHubUser get user => _user;
  List<GitHubUser> get usersList => _usersList;

  void setUser(GitHubUser user) {
    _user = user;
    notifyListeners();
  }

  void setUserSearchResult(List<GitHubUser> usersList) {
    _usersList = usersList;
    notifyListeners();
  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }

  void clearUsersList() {
    _usersList = [];
    notifyListeners();
  }
}
