import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter7plus/News%20App/AticleModel.dart';
import 'package:flutter7plus/News%20App/NewsReusableComponemts.dart';
import 'package:http/http.dart' as http;
class AllNew extends StatefulWidget {
  const AllNew({Key? key}) : super(key: key);

  @override
  _AllNewState createState() => _AllNewState();
}

class _AllNewState extends State<AllNew> {

  List<ArticleModel> listOfArticleModels  = [];
   @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAllNews(),
      builder: (contex,snapshot){
        return ListView.builder(
          itemBuilder: (context,index){
            return articleBuilder(listOfArticleModels[index]);
          },
          itemCount: listOfArticleModels.length,
        );
      },
    );
  }
  // method that gets articles from API
  getAllNews()async{
   var response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&apiKey=8c8f9eb739764d4e9afa1438762e673b'));
 //  print(jsonDecode(response.body));
   var jsonMap = jsonDecode(response.body);
   // print(jsonMap["status"]);
   // print(jsonMap["totalResults"]);
   var jsonList = jsonMap["articles"];
   print(listOfArticleModels.length);
   for(Map m in jsonList){
    var modelObject =  ArticleModel(url:m['urlToImage'],
        articleTitle: m['title'],
        articleSubTitle: m['description'],
        source: m['source']['name']);
    listOfArticleModels.add(modelObject);
   }
   print(listOfArticleModels.length);
  }

  @override
  void initState() {
    getAllNews();
  }
}


