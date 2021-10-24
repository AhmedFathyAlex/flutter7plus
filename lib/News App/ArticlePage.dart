import 'package:flutter/material.dart';
import 'package:flutter7plus/News%20App/AticleModel.dart';
class ArticlePage extends StatelessWidget {
   ArticlePage(this.model);
ArticleModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Image.network('${model.url}'),
          Text(model.source.toString()),
          Text(model.articleTitle.toString()),
        Text(model.articleSubTitle.toString()),
    ]
      ),
    );
  }
}
