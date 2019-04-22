import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class bookScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return bookScreenState();
  }
}

class bookScreenState extends State<bookScreen> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController _title = TextEditingController();
  TextEditingController _author = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Book"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'title'),
                controller: _title,
                validator: (value) {
                  if (value.isEmpty) {
                    return "please fill title";
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'author'),
                controller: _author,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please fill author";
                  }
                },
              ),
              RaisedButton(
                child: Text('Save'),
                onPressed: () {
                  if (_formkey.currentState.validate()) {
                    //save to clound store
                    Firestore.instance
                        .collection('books')
                        .add({'title': _title.text, 'author': _author.text}).then((doc){
                          print(doc.toString());
                        });
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
