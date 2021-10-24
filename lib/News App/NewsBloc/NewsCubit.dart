import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter7plus/News%20App/AllNews.dart';
import 'package:flutter7plus/News%20App/NewsBloc/NewsStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../AticleModel.dart';
import '../BuisnessNews.dart';
import '../SportsNews.dart';

class NewsCubit extends Cubit<NewsStates>{
  // create constructor calling super constructor with initial state
  NewsCubit():super(NewsInitialState());
  // create method gets object from newsCubit
  static NewsCubit getNewsCubit(BuildContext context){
    return BlocProvider.of(context);
  }
  // data
  int index = 0;
  List<String> appBarTitles = ['All News', 'Sports','Buisness'];
  List<Widget> scaffoldBodies = [AllNews(),SportsNews(),BuisnessNews()];
  List allnews = [];
  List sportsnews = [];
  List buisnessnews = [];
 //methods
  void changeIndex(int newindex){
    index = newindex;
    emit(NewsBottomNavigationBarChanged());
  }
  getAllNews()async{
    emit(NewsgetAllNewsStarted());
    var response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&apiKey=8c8f9eb739764d4e9afa1438762e673b'));
    //  print(jsonDecode(response.body));
    var jsonMap = jsonDecode(response.body);
    // print(jsonMap["status"]);
    // print(jsonMap["totalResults"]);
    var jsonList = jsonMap["articles"];
    for(Map m in jsonList){
      var modelObject =  ArticleModel(url:m['urlToImage'],
          articleTitle: m['title'],
          articleSubTitle: m['description'],
          source: m['source']['name']);
      allnews.add(modelObject);
      emit(NewsAllNewsDataFetchedSuccessfully());
    }

  }
  getBuisnessNews()async{
    emit(NewsgetBuisnessNewsStarted());
    var response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&category=Business&apiKey=8c8f9eb739764d4e9afa1438762e673b'));
    //  print(jsonDecode(response.body));
    var jsonMap = jsonDecode(response.body);
    // print(jsonMap["status"]);
    // print(jsonMap["totalResults"]);
    var jsonList = jsonMap["articles"];
    for(Map m in jsonList){
      var modelObject =  ArticleModel(url:m['urlToImage'],
          articleTitle: m['title'],
          articleSubTitle: m['description'],
          source: m['source']['name']);
      buisnessnews.add(modelObject);
      emit(NewsBuisnessNewsDataFetchedSuccessfully());
    }
  }
  getSportsNews()async{
    emit(NewsgetSportsNewsStarted());
    var response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=8c8f9eb739764d4e9afa1438762e673b'));
    //  print(jsonDecode(response.body));
    var jsonMap = jsonDecode(response.body);
    // print(jsonMap["status"]);
    // print(jsonMap["totalResults"]);
    var jsonList = jsonMap["articles"];
    for(Map m in jsonList){
      var modelObject =  ArticleModel(url:m['urlToImage'],
          articleTitle: m['title'],
          articleSubTitle: m['description'],
          source: m['source']['name']);
      sportsnews.add(modelObject);
    }
    emit(NewsSportsNewsDataFetchedSuccessfully());
  }
}