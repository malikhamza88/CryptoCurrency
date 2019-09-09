import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'homepage.dart';
import 'dart:convert' as JSON;

void main() async {
  List currencies=await getCurrencies();
  print(currencies);
  runApp(MyApp(currencies));
}

class MyApp extends StatelessWidget {
  final List _currencies;

  MyApp(this._currencies);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.brown
      ),
      home: HomePage(_currencies),

    );
  }
}

Future<List> getCurrencies() async {
  String url = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
  http.Response response = await http.get(url);
  return JSON.jsonDecode(response.body);
}
