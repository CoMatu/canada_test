import 'package:flutter/material.dart';
// сделал этот класс для возможности авторизации и записи в реальный репо, также для поиска юзеров на ГитХабе

class GitHubUser {
  final String login;
  final int id;
  final String nodeId;
  final String avatarUrl;
  final String gravatarId;
  final String url;
  final String htmlUrl;
  final String followersUrl;
  final String followingUrl;
  final String gistsUrl;
  final String starredUrl;
  final String subscriptionsUrl;
  final String organizationsUrl;
  final String reposUrl;
  final String eventsUrl;
  final String receivedEventsUrl;
  final String type;
  final bool siteAdmin;

  GitHubUser({
    @required this.login,
    @required this.id,
    @required this.nodeId,
    @required this.avatarUrl,
    @required this.gravatarId,
    @required this.url,
    @required this.htmlUrl,
    @required this.followersUrl,
    @required this.followingUrl,
    @required this.gistsUrl,
    @required this.starredUrl,
    @required this.subscriptionsUrl,
    @required this.organizationsUrl,
    @required this.reposUrl,
    @required this.eventsUrl,
    @required this.receivedEventsUrl,
    @required this.type,
    @required this.siteAdmin,
  });
}
