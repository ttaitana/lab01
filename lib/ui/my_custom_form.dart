import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form page'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Image.asset("resource/logo.png", height: 200),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email or Username',
                hintText: 'Please input your username or email',
                icon: Icon(Icons.person)
              ),
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) => print(value),
              validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
            }),
            // RaisedButton(child: Text('Enter'),
            //   onPressed: () {
            //     if (_formKey.currentState.validate()) {
            //       Scaffold.of(context)
            //           .showSnackBar(SnackBar(content: Text('Process Data')));
            //     }
            //   },
            // ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Please input your password',
                icon: Icon(Icons.lock)
              ),
              obscureText: true,
              keyboardType: TextInputType.text,
              onSaved: (value) => print(value),
              validator: (value) {
              if (value.isEmpty) {
                return 'Please enter password';
              }
            }),
            RaisedButton(child: Text('Enter'),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Process Data')));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
