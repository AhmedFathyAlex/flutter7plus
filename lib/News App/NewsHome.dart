import 'package:flutter/material.dart';
import 'package:flutter7plus/News%20App/AllNews.dart';
import 'package:flutter7plus/News%20App/BuisnessNews.dart';
import 'package:flutter7plus/News%20App/SportsNews.dart';
class NewsHome extends StatefulWidget {
  const NewsHome({Key? key}) : super(key: key);

  @override
  _NewsHomeState createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  int index = 0;
  List<String> appBarTitles = ['All News', 'Sports','Buisness'];
  List<Widget> scaffoldBodies = [AllNew(),Sports(),Buisness()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitles[index]),
      ),
      body: scaffoldBodies[index],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.list_alt),label: "All"),
          BottomNavigationBarItem(icon:Icon(Icons.sports_football) ,label: "Sports"),
          BottomNavigationBarItem(icon: Icon(Icons.monetization_on),label: "Buisness"),
        ],
        currentIndex: index,
        onTap: (newIndex){
          setState(() {
            index = newIndex;
          });
        },
      ),
    );
  }
}
