
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register Screen'),),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 50),
              child: Text("Register", style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
            ),
            TextField(
              controller:  namecontroller,
              decoration: InputDecoration(
                  icon: Icon(Icons.text_fields),
                  hintText: "Enter Your Name"
              ),
            ),
            SizedBox(height: 20,),
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
              print(namecontroller.text);
             register(namecontroller.text, emailcontroller.text, passcontroller.text);

            }, child: Text("Register"))
          ]
      ),
    );
  }
}
 register(String name,String email,String password) async {
  final response = await http.post(
    Uri.parse('https://retail.amit-learning.com/api/register'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(
        <String, String>{
      'name': name,
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print("User Registered Successfully");
    print(jsonDecode(response.body)['token']);

  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create User.');
  }
}
