import 'package:flutter/material.dart';
import 'package:flutter7plus/News%20App/ArticlePage.dart';
import 'package:flutter7plus/News%20App/AticleModel.dart';

Widget articleBuilder(ArticleModel model, BuildContext context){
  return  InkWell(
    onTap: (){
     Navigator.push(context, MaterialPageRoute(builder: (context){
       return ArticlePage(model);
     }));
    },
    child: ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(model.url!),),
      title: Text(model.articleTitle!),
      subtitle: Text(model.articleSubTitle!),
      trailing:Text(model.source!) ,
    ),
  );
}