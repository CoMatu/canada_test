import 'package:flutter/material.dart';
import 'package:hello_canada/domain/app_repository.dart';
import 'package:hello_canada/domain/providers/repos_provider.dart';
import 'package:hello_canada/presentation/widgets/progress_hud.dart';
import 'package:provider/provider.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String searchQuery = "Search query";
  bool _isSearch;

  @override
  void initState() {
    _isSearch = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('GitHub Client'),
        ),
        body: Stack(
          children: <Widget>[
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FlutterLogo(
                      size: 70.0,
                    ),
                    Text(
                      'Hello, Guest!',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Row(children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Input repo name...',
                              ),
                              keyboardType: TextInputType.text,
                              onSaved: (val) {
                                searchQuery = val;
                              },
                              validator: (val) {
                                if (val.isEmpty || val.length < 1) {
                                  return 'Enter a query...';
                                }
                                return null;
                              },
                            ),
                          ),
                          OutlineButton(
                            onPressed: () {
                              startSearch();
                            },
                            child: Text('Search'),
                          )
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text('You can find any repo on GitHub!'),
                    ),
                  ],
                ),
              ),
            ),
            _isSearch ? ProgressHUD() : Container()
          ],
        ),
      ),
    );
  }

  void startSearch() async {
    final FormState formState = _formKey.currentState;
    formState.save();
    if (formState.validate()) {
      setState(() {
        _isSearch = true;
      });
      var repos = await AppRepositoryImpl().getRepos(searchQuery);
      if (repos != null) {
        formState.reset();
        Navigator.pushNamed(context, '/dashboard');

        Provider.of<RepoProvider>(context, listen: false)
            .setReposSearchResult(repos);
        setState(() {
          _isSearch = false;
        });
      } else {
        _displaySnackBar(context, 'Something went wrong');
      }
    }
  }

  void _displaySnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
