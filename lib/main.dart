import 'package:flutter/material.dart';
import 'package:neoapp/data.dart';
import 'package:neoapp/widget/cardselection.dart';
import 'package:neoapp/widget/expenseSection.dart';
import 'package:neoapp/widget/header.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Schyler'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Container(
            height: 120,
            child: WalletHeader(),
          ),
          Expanded(child: CardSelection()),
          Expanded(child: ExpenseSection()),
        ],
      ),
    );
  }
}
