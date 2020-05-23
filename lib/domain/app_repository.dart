import 'package:dio/dio.dart';
import 'package:hello_canada/domain/entities/git_hub_user.dart';
import 'package:hello_canada/domain/entities/repo.dart';

abstract class AppRepository {
  Future<List<GitHubUser>> getSearchResults(String query);
  Future<List<Repo>> getRepos(String user);
}

class AppRepositoryImpl implements AppRepository {
  Dio dio;
  BaseOptions options = new BaseOptions(
    baseUrl: 'https://api.github.com/',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  Response response;

  @override
  Future<List<GitHubUser>> getSearchResults(String query) async {
    List<GitHubUser> users = [];

    final dio = Dio(options);
    response = await dio.get('search/users?q=user:$query');
    if (response.statusCode == 200) {
      List resList = response.data['items'];

      resList.forEach((element) {
        final _user = GitHubUser(
          login: element['login'],
          id: element['id'],
          nodeId: element['node_id'],
          avatarUrl: element['avatar_url'],
          gravatarId: element['gravatar_id'],
          url: element['url'],
          htmlUrl: element['html_url'],
          followersUrl: element['followers_url'],
          followingUrl: element['following_url'],
          gistsUrl: element['gists_url'],
          starredUrl: element['starred_url'],
          subscriptionsUrl: element['subscriptions_url'],
          organizationsUrl: element['organizations_url'],
          reposUrl: element['repos_url'],
          eventsUrl: element['events_url'],
          receivedEventsUrl: element['received_events_url'],
          type: element['type'],
          siteAdmin: element['site_admin'],
        );
        users.add(_user);
      });
    }
    return users;
  }

  @override
  Future<List<Repo>> getRepos(String query) async {
    List data;
    final dio = Dio(options);
    response = await dio.get('search/repositories?q=$query+in:name');

    response.statusCode == 200 ? data = response.data['items'] : data = [];

    return Repo.mapJSONStringToList(data);
  }
}
