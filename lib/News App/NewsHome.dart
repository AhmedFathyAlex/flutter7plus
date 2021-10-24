import 'package:flutter/material.dart';
import 'package:flutter7plus/News%20App/AllNews.dart';
import 'package:flutter7plus/News%20App/BuisnessNews.dart';
import 'package:flutter7plus/News%20App/NewsBloc/NewsCubit.dart';
import 'package:flutter7plus/News%20App/NewsBloc/NewsStates.dart';
import 'package:flutter7plus/News%20App/SportsNews.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class NewsHome extends StatelessWidget {

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> NewsCubit()..getAllNews()..getBuisnessNews()..getSportsNews(),
      child: BlocConsumer<NewsCubit,NewsStates>(
          listener:(context,state){},
          builder:(context,state){
            var myCubit = NewsCubit.getNewsCubit(context);
            return Scaffold(
                appBar: AppBar(
                title: Text(myCubit.appBarTitles[myCubit.index])),
       body: myCubit.scaffoldBodies[myCubit.index],
    bottomNavigationBar: BottomNavigationBar(
    items: [
    BottomNavigationBarItem(icon:Icon(Icons.list_alt),label: "All"),
    BottomNavigationBarItem(icon:Icon(Icons.sports_football) ,label: "Sports"),
    BottomNavigationBarItem(icon: Icon(Icons.monetization_on),label: "Buisness"),
    ],
    currentIndex: myCubit.index,
    onTap: (newIndex){
      myCubit.changeIndex(newIndex);
    }
    ));
  }
    ));
}
}

