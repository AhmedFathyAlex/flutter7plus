import 'package:flutter/material.dart';
class Api extends StatefulWidget {
  const Api({Key? key}) : super(key: key);

  @override
  _ApiState createState() => _ApiState();
}

class _ApiState extends State<Api> {
  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 2), (){
      return 'Future is here ';
  }
  );
       List<Widget> bodyList = [
         Text('Waiting for data'),
         CircularProgressIndicator()
       ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API')),
      body: FutureBuilder<String>(
          future: _calculation, // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if(snapshot.hasData){
              bodyList = [
                Icon(Icons.check_circle,color: Colors.green,size: 50,),
                SizedBox(height: 25,),
                Text(snapshot.data.toString())
              ];
            }
            return Center(
              child: Column(
                children: bodyList,
                mainAxisAlignment: MainAxisAlignment.center,
              )
            );
          },
        ),
    );

  }
}
