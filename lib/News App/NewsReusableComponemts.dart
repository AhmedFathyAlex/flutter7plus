import 'package:flutter/material.dart';
import 'package:flutter7plus/News%20App/AticleModel.dart';

Widget articleBuilder(ArticleModel model){
  return  ListTile(
    leading: CircleAvatar(backgroundImage: NetworkImage(model.url!),),
    title: Text(model.articleTitle!),
    subtitle: Text(model.articleSubTitle!),
    trailing:Text(model.source!) ,
  );
}