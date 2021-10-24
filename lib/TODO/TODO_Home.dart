import 'package:flutter/material.dart';
import 'package:flutter7plus/TODO/Screens/AllTasks.dart';
import 'package:flutter7plus/TODO/Screens/DoneTasks.dart';
import 'package:sqflite/sqflite.dart';
import 'Constants.dart';
import 'Screens/ArchivedTasks.dart';
class TodoHome extends StatefulWidget {
  const TodoHome({Key? key}) : super(key: key);

  @override
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  List titles = ['All Tasks', 'Done Tasks' , 'Archived Tasks'];
  List Screens = [AllTasks(),DoneTasks(),ArchivedTasks()];
  int myIndex = 0;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late Database myDB;
  TextEditingController titleC = TextEditingController();
  TextEditingController dateC = TextEditingController();
  TextEditingController timeC = TextEditingController();
  bool isBottomSheetShown = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(isBottomSheetShown){
            insertToDB(titleC.text,dateC.text,timeC.text);
            titleC.text = '';
            dateC.text = '';
            timeC.text = '';
            Navigator.pop(context);
            readFromDB();
            isBottomSheetShown = false;
          }
          else{
            scaffoldKey.currentState!.showBottomSheet((context) {
              return Container(
                color: Colors.grey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleC,
                      decoration: InputDecoration(
                        labelText: "title",

                      ),
                    ),
                    TextField(
                      controller: dateC,
                      decoration: InputDecoration(
                        labelText: "date",

                      ),
                    ),
                    TextField(
                      controller: timeC,
                      decoration: InputDecoration(
                        labelText: "time",

                      ),
                    ),
                  ],
                ),
              );
            }
            );
            isBottomSheetShown = true;
          }
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: Text(titles[myIndex]),),
      body:Screens[myIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.format_align_left_sharp),label: "All Tasks"),
          BottomNavigationBarItem(icon: Icon(Icons.done),label: "Done Tasks"),
          BottomNavigationBarItem(icon: Icon(Icons.archive),label: "Archived Tasks"),
        ],
        currentIndex: myIndex,
        onTap: (index){
          setState(() {
            myIndex = index;
          });
        },
      ),
    );
  }

  @override
  void initState() {
    createAndOpenDB().then((value) {
     readFromDB();
    });

  }
  Future createAndOpenDB() async {
    myDB = await openDatabase('myTodo2.db',
    version: 1,
    onCreate: (Database myDb,int version){
     myDb.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT,time TEXT,status TEXT)')
         .then((value){
           print("table created successfully");
     }).onError((error, stackTrace){
       print("Error happened while creating table $error");
     });
    },
    onOpen:(Database myDb){
      print("Database opened");
    }
    );
    return;
  }
  void insertToDB(String title,String date,String time)async{
    myDB.rawInsert('INSERT INTO tasks (title, date, time,status) VALUES("$title","$date","$time","new")')
        .then((value){
          print('Row number $value inserted');
    }).catchError((error){
      print('error happened when inserting row $error');
    });
  }
  void readFromDB()async{
   tasksList = await myDB.rawQuery('SELECT * FROM tasks');
   print('My tasks List');
   print(tasksList);
  }
}
//'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)')