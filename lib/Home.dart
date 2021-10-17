import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: Text("Home Page")
    )
    );
  }

  @override
  void initState() {
    getProducts();
  }
}
 getProducts() async {
  final response = await http.get(Uri.parse('https://retail.amit-learning.com/api/products'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print("Request sent successfully");
    print(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
