import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
class TodoHome extends StatefulWidget {
  const TodoHome({Key? key}) : super(key: key);

  @override
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
      ),
      appBar: AppBar(title: Text("Todo App"),),
      body:Center(child:Text('Todo Home')) ,
    );
  }

  @override
  void initState() {
    createAndOpenDB();
  }
  createAndOpenDB()async{
    Database db = await openDatabase('todo2.db',
    version: 1,
    onCreate: (Database myDb,int version){
      print("Database Created");
    },
    onOpen:(Database myDb){
      print("Database opened");
    }
    );
  }
}
