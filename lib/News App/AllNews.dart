import 'package:flutter/material.dart';
import 'package:flutter7plus/News%20App/NewsBloc/NewsCubit.dart';
import 'package:flutter7plus/News%20App/NewsBloc/NewsStates.dart';
import 'package:flutter7plus/News%20App/NewsReusableComponemts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AllNews extends StatelessWidget {
  const AllNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state) {
        var myCubit = NewsCubit.getNewsCubit(context);
        if (state is NewsgetAllNewsStarted) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else {
          return ListView.builder(itemBuilder: (context, index) {
            return articleBuilder(myCubit.allnews[index],context);
          },
            itemCount: myCubit.allnews.length,);
        }
      }
    );
  }
}
