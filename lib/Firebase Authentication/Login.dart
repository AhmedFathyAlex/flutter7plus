import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter7plus/News%20App/NewsHome.dart';
import 'package:fluttertoast/fluttertoast.dart';
class LoginFirebase extends StatefulWidget {

  @override
  _LoginFirebaseState createState() => _LoginFirebaseState();
}

class _LoginFirebaseState extends State<LoginFirebase> {
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
              fbA.signInWithEmailAndPassword(email: emailC.text, password: passC.text).
              then((value){
                print("User created successfully with ${value.user!.uid}");
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return NewsHome();
                }));
              })
                  .catchError((err){
                print('error happened while registeration $err');
                Fluttertoast.showToast(
                    msg: "Error!!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM  ,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red ,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              });
            }, child: Text('Register'))
          ],
        ),
      ),
    );
  }


}
