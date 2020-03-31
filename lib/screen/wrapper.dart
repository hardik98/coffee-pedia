import 'package:coffee_pedia/screen/authenticate/authenticate.dart';
import 'package:coffee_pedia/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffee_pedia/model/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    //based on authentication redirect to either home screen or registration screen
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
