class Product{
  late int id;
  late String name;
 late String title;
 late var price;
 late String image;
 Product.fromJson(Map<String,dynamic> productMap){
    this.id = productMap['id'];
    this.name = productMap['name'];
    this.title = productMap['title'];
    this.price = productMap['price'];
    this.image = productMap['avatar'];
 }
}