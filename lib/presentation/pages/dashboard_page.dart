import 'package:flutter/material.dart';
import 'package:hello_canada/domain/providers/repos_provider.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Search Results'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Consumer<RepoProvider>(
                builder: (context, provider, child) {
                  return provider.reposList.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: provider.reposList.length + 1,
                          itemBuilder: (BuildContext context, int index) {
                            return index < provider.reposList.length
                                ? Hero(
                                    tag: provider.reposList[index].hashCode,
                                    child: Card(
                                      child: ListTile(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/details',
                                              arguments:
                                                  provider.reposList[index]);
                                        },
                                        title: Text(
                                            provider.reposList[index].name),
                                      ),
                                    ),
                                  )
                                : SizedBox(
                                    height: 77.0,
                                  );
                          },
                        )
                      : Center(
                          child: Text(
                          'Nothing found',
                          style: Theme.of(context).textTheme.headline5,
                        ));
                },
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add_repo');
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
