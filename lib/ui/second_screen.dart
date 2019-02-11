import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page'),
      ),
      body: Center(
        child: FlatButton(
          child: Text('save'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
