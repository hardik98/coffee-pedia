import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_pedia/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:coffee_pedia/services/database.dart';
import 'package:provider/provider.dart';
import 'coffee_list.dart';
import 'package:coffee_pedia/model/coffee.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Coffee>>.value(
      value: DatabaseService().coffee,
      child: Scaffold(
        backgroundColor: Colors.brown[777],
        appBar: AppBar(
          title: Text('Coffee pedia'),
          centerTitle: true,
          backgroundColor: Colors.brown[400],
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('log out'),
            ),
          ],
        ),
        body: CoffeeList(),
      ),
    );
  }
}