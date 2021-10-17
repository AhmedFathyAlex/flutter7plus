
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter7plus/Authorization/Register.dart';
import 'package:http/http.dart' as http;
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Screen'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
        Padding(
          padding: const EdgeInsets.only(left: 20,top: 50),
          child: Text("Login", style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
        ),
          TextField(
            controller:  emailcontroller,
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              hintText: "Enter Your Email"
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              suffix: Icon(Icons.visibility_off),
                icon: Icon(Icons.lock),
                hintText: "Enter Your Password"
            ),
            controller: passcontroller,
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            print(emailcontroller.text);
            print(passcontroller.text);
            login(emailcontroller.text, passcontroller.text);
          }, child: Text("Login"))
      ]
      ),
    );
  }
}

login(String email,String password) async {
  final response = await http.post(
    Uri.parse('https://retail.amit-learning.com/api/login'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print("User Logged In Successfully");
    print(jsonDecode(response.body)['token']);

  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    print(jsonDecode(response.body));
    throw Exception('Failed to Login.');
  }
}

