import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                validator: (value) {
                  if (value.isEmpty) return "Email is required";
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                controller: passwordController,
                validator: (value) {
                  if (value.isEmpty) return "Password is required";
                },
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      child: Text("Sign in"),
                      onPressed: () {
                        if (_formkey.currentState.validate()) {
                          auth
                              .signInWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text
                                  // email: "wannowo@gmail.com", password: "12345678"
                                  )
                              .then((FirebaseUser user) {
                            if (user.isEmailVerified) {
                              print('to home page');
                              Navigator.pushNamed(context, '/data');
                            } else {
                              print(
                                  'Please check your email to vertify account');
                            }
                          });
                        } else {
                          print("Error");
                        }
                      },
                    ),
                  ),
                ],
              ),
              FlatButton(
                child: Text('Register new user'),
                onPressed: () {
                  Navigator.pushNamed(context, "/register");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
