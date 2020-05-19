import 'package:flutter/material.dart';

class SageDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog"),
        actions: [
          FlatButton(
            child: Text("Button"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          "add record"
        ),
      ),
    );
  }
}