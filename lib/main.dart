import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter7plus/Api.dart';
import 'package:flutter7plus/Authorization/LoginScreen.dart';
import 'package:flutter7plus/Bloc/BlocObserver.dart';
import 'package:flutter7plus/Bloc/CounterBloc.dart';
import 'package:flutter7plus/Firebase%20Authentication/Login.dart';
import 'package:flutter7plus/Firebase%20Authentication/Register.dart';
import 'package:flutter7plus/News%20App/NewsHome.dart';
import 'package:flutter7plus/Authorization/Register.dart';
import 'package:flutter7plus/Revision.dart';
import 'package:flutter7plus/TODO/TODO_Home.dart';
import 'package:flutter7plus/finalTest.dart';
import 'Home.dart';
void main()async{
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginFirebase(),
  )
  );
}




























// initialRoute: '/second',
// routes: {
//   // When navigating to the "/" route, build the FirstScreen widget.
//   '/': (context) => Mystful(),
//   // When navigating to the "/second" route, build the SecondScreen widget.
//   '/second': (context) => Mystless(),
// },
// debugShowCheckedModeBanner: false,
// //home: Mystful()
//
  /*
Widget loginScreen(){
  return Scaffold(
    appBar: AppBar(
      title: Text("Login"),
    ),
   body: Container(
     child: Column(
       children: [
         Image.network("https://static.vecteezy.com/system/resources/previews/002/710/265/original/profile-login-style-vector.jpg", width: 300, height: 200,),
       TextField(
           decoration: InputDecoration(
             icon: Icon(Icons.person),
             hintText: "User Name",
           ),
       ),
         TextField(
           obscureText: true,
           decoration: InputDecoration(
             icon: Icon(Icons.lock),
             hintText: "Passward",
           ),
         ),
         SizedBox(height: 15),
         ElevatedButton(onPressed: (){},
             child: Text("Login")
         )
       ],
     ),
   ),
  );
}


  
// }
// AppBar buildAppBar(){
//   return AppBar(
//     title: Text('My Profile'),
//     leading: IconButton(
//       icon: Icon(Icons.home),
//       onPressed: (){
//         print('Leading icon has bene pressed ');
//       }, //void callBack , anonymousFyunctoin
//     ),
//
//   );
// }
// Widget buildScaffoldBody({required String name,required String job}){
//   return Center(
//     child: Column(
//       mainAxisAlignment:MainAxisAlignment.center ,
//       children: [
//         // Container(
//         //   child: Center(child: Text('Ahmed Fathy',style: TextStyle(color: Colors.white),)),
//         //   width: 300,
//         //   height: 200,
//         //   decoration: BoxDecoration(
//         //     image: DecorationImage(
//         //       image: AssetImage('images/d.jpg')
//         //     ),
//         //     borderRadius: BorderRadius.circular(15),
//         //     shape: BoxShape.circle
//         //   ),
//         // ),
//         CircleAvatar(
//           backgroundImage: AssetImage('images/d.jpg'),
//           radius: 80,
//         ),
//         Text(name,style: TextStyle(
//             fontSize: 30,
//             fontWeight: FontWeight.bold
//         ),),
//         Text(job,style: TextStyle(
//             fontSize: 15,
//             fontStyle: FontStyle.normal,
//             color: Colors.grey
//         ),),
//       ],
//     ),
//   );
// }
// Widget returnScaffold(){
//   return Scaffold(
//     backgroundColor: Colors.grey[200],
//     appBar: buildAppBar(),
//     body: buildScaffoldBody(name: "Salah",job: "Coach")
//   );
// }

   */
