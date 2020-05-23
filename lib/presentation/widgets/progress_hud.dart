import 'package:flutter/material.dart';

class ProgressHUD extends StatelessWidget {
  const ProgressHUD({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            height: 200.0,
            width: 200.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.black26),
          ),
          Positioned.fill(
              child: Padding(
            padding: const EdgeInsets.all(70.0),
            child: CircularProgressIndicator(),
          )),
        ],
      ),
    );
  }
}
