import 'package:flutter/material.dart';
import 'package:hello_canada/domain/entities/repo.dart';

class RepoDetailesPage extends StatelessWidget {
  const RepoDetailesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Repo repo = ModalRoute.of(context).settings.arguments;

    return Material(
      child: Hero(
        tag: repo.hashCode,
        child: Scaffold(
          appBar: AppBar(title: Text(repo.name)),
          body: Container(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Name: ${repo.name}',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Divider(),
                    Text(
                      'Description:',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    repo.description != null
                        ? Text(
                            repo.description,
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        : Text('None'),
                    Divider(),
                    Text(
                      'Owner: ${repo.owner}',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Divider(),
                    Text(
                      'WatchersCount: ${repo.watchersCount}',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 55.0,
                    ),
                    repo.isFake
                        ? Align(
                            alignment: Alignment.center,
                            child: OutlineButton(
                                onPressed: () {}, child: Text('Edit Repo')),
                          )
                        : Container()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
