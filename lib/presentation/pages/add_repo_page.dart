import 'package:flutter/material.dart';
import 'package:hello_canada/domain/entities/repo.dart';
import 'package:hello_canada/domain/providers/repos_provider.dart';
import 'package:provider/provider.dart';

class AddRepoPage extends StatefulWidget {
  AddRepoPage({Key key}) : super(key: key);

  @override
  _AddRepoPageState createState() => _AddRepoPageState();
}

class _AddRepoPageState extends State<AddRepoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _name, _description, _onwer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add repo')),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      onSaved: (val) => _name = val,
                      decoration: InputDecoration(
                        labelText: 'Enter repo name',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter repo name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      onSaved: (val) => _description = val,
                      decoration: InputDecoration(
                        labelText: 'Enter repo description',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter repo description';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      onSaved: (val) => _onwer = val,
                      decoration: InputDecoration(
                        labelText: 'Enter repo owner',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter repo owner';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Exit'),
                        ),
                        RaisedButton(
                          onPressed: () {
                            saveRepo();
                          },
                          child: Text('Save'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void saveRepo() {
    if (_formKey.currentState.validate()) {
      final FormState formState = _formKey.currentState;
      formState.save();
      Repo _repo = Repo('url', 0, 'ru', _description, _name, _onwer, true);
      Provider.of<RepoProvider>(context, listen: false).addRepo(_repo);
      Navigator.pop(context);
    }
  }
}
