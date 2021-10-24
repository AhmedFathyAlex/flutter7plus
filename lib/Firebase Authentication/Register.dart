import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  bool isShown = true;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('https://www.amit-learning.com/assets/logo.png'),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: nameC,
                decoration: InputDecoration(
                labelText: 'Name'
              ),),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: emailC,
                decoration: InputDecoration(
                    labelText: 'email'
                ),),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                obscureText: isShown,
                controller: passC,
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: (){
                      setState(() {
                        isShown = !isShown;
                      });
                    },
                      child: Icon(isShown?Icons.visibility_off:Icons.visibility),
                  ),
                    labelText: 'password'
                ),),
            ),
            ElevatedButton(onPressed: (){

              FirebaseAuth fbA = FirebaseAuth.instance;
              fbA.createUserWithEmailAndPassword(email: emailC.text, password: passC.text).
              then((value){
                print("User created successfully with ${value.user!.uid}");
                Fluttertoast.showToast(
                    msg: "User created successfully with ${value.user!.uid}",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green ,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              })
                  .catchError((err){
                print('error happened while registeration $err');
              });
            }, child: Text('Register'))
          ],
        ),
      ),
    );
  }


}
