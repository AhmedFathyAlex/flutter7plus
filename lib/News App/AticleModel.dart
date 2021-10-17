class ArticleModel{
  // fields
  String? url;
  String? articleTitle;
  String? articleSubTitle;
  String? source;

  //Constructor
  ArticleModel(
      {this.url, this.articleTitle, this.articleSubTitle, this.source}){
    if(this.url == null){
      url = "";
    }
    if(this.articleTitle == null){
      articleTitle = "";
    }
    if(this.articleSubTitle == null){
      articleSubTitle = "";
    }
    if(this.source == null){
      source = "";
    }
  }


}