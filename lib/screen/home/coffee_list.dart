import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffee_pedia/services/database.dart';
import 'package:coffee_pedia/model/coffee.dart';


class CoffeeList extends StatefulWidget {
  @override
  _CoffeeListState createState() => _CoffeeListState();
}

class _CoffeeListState extends State<CoffeeList> {
  @override
  Widget build(BuildContext context) {

    final coffees = Provider.of<List<Coffee>>(context);
     print('testing coffees $coffees');
     
      return Container(
      
     );
  }
}