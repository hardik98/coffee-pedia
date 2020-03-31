import 'package:coffee_pedia/services/auth.dart';
import 'package:coffee_pedia/shared/constants.dart';
import 'package:coffee_pedia/shared/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  // sign in data
  String email;
  String passWord;
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loader() : Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text('Sign in to coffee pedia'),
        backgroundColor: Colors.brown[400],
        elevation: 0,
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(Icons.person),
            label: Text('Register'),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                  decoration: textInputDecorator.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty ? 'please enter email' : null,
                onChanged: (value) {
                  setState(() {
                    return email = value;
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: textInputDecorator.copyWith(hintText: 'Password'),
                validator: (val) =>
                    val.isEmpty ? 'please enter Password' : null,
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    return passWord = value;
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                color: Colors.pink[400],
                onPressed: () async {
                  if (_formkey.currentState.validate()) {
                     setState(() {
                       loading = true;
                     });
                    dynamic result =
                        await _auth.signInWithEmailAndPassword(email, passWord);
                    if (result == null) {
                      setState(() {
                         error = 'could not sign in with that credential';
                         loading = false;
                      });
                    }
                  } else {
                    // do something else
                  }
                },
                child: Text(
                  'sign in',
                  style: TextStyle(color: Colors.white),
                ),
              ),
                SizedBox(
                height: 20.0,
              ),
              Text(
                error,
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
