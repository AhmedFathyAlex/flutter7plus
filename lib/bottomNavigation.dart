// import 'package:flutter/material.dart';
//
// class MyStatefulWidget extends StatefulWidget {
//   @override
//   MyStatefulWidgetState createState() => MyStatefulWidgetState();
// }
//
// class MyStatefulWidgetState extends State<MyStatefulWidget> {
//   // int counter = 5;
//   int myIndex = 0;
//   var titles = [
//     Text('Home Screen'),
//     Text('Search Screen'),
//     Text('Settings Screen'),
//   ];
//   List<Widget> myScreens = [
//     Center(
//       child: Text(
//         'Home',
//         style: TextStyle(fontSize: 50),
//       ),
//     ),
//     Center(
//       child: Text(
//         'Search',
//         style: TextStyle(fontSize: 50),
//       ),
//     ),
//     Center(
//       child: Text(
//         'Settings',
//         style: TextStyle(fontSize: 50),
//       ),
//     ),
//   ];
//   // bool changeIcon = true;
//   // @override
//   // void initState() {
//   //   print('stateful widget created');
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: (){
//       //     if(changeIcon){
//       //       setState(() {
//       //         changeIcon = !changeIcon;
//       //         counter++;
//       //         print(counter);
//       //       });
//       //     }
//       //     else{
//       //       setState(() {
//       //         changeIcon = !changeIcon;
//       //         counter--;
//       //         print(counter);
//       //       });
//       //     }
//       //
//       //   },
//       //   child:changeIcon? Icon(Icons.add) : Icon(Icons.remove),
//       // ),
//       appBar: AppBar(title: titles[myIndex]),
//       body: myScreens[myIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: (index) {
//           setState(() {
//             myIndex = index;
//           });
//         },
//         currentIndex: myIndex,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.settings), label: "settings"),
//         ],
//       ),
//     );
//   }
// }
/*
*
Future<http.Response> login(String email,String password) {
 return  http.post(
    Uri.parse('https://retail.amit-learning.com/api/login'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password' : password
    }),
  ).then((value){
    print(jsonDecode(value.body));
    return value;
  });
}*/
