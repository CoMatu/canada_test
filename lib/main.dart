import 'package:flutter/material.dart';
import 'package:hello_canada/domain/providers/repos_provider.dart';
import 'package:hello_canada/domain/providers/user_provider.dart';
import 'package:hello_canada/presentation/pages/add_repo_page.dart';
import 'package:hello_canada/presentation/pages/dashboard_page.dart';
import 'package:hello_canada/presentation/pages/repo_detailes_page.dart';
import 'package:hello_canada/presentation/pages/start_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    child: MyApp(),
    providers: [
      ChangeNotifierProvider(create: (context) => UserProvider()),
      ChangeNotifierProvider(create: (context) => RepoProvider()),
    ],
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => StartPage(),
        '/dashboard': (context) => DashboardPage(),
        '/details': (context) => RepoDetailesPage(),
        '/add_repo': (context) => AddRepoPage(),
      },
    );
  }
}
