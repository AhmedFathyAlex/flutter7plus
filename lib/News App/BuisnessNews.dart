import 'package:flutter/material.dart';
import 'package:flutter7plus/News%20App/NewsBloc/NewsCubit.dart';
import 'package:flutter7plus/News%20App/NewsBloc/NewsStates.dart';
import 'package:flutter7plus/News%20App/NewsReusableComponemts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class BuisnessNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var myCubit = NewsCubit.getNewsCubit(context);
        return ListView.builder(itemBuilder:(context,index){
          return articleBuilder(myCubit.buisnessnews[index],context);
        },
          itemCount: myCubit.buisnessnews.length,);
      },
    );
  }
}
