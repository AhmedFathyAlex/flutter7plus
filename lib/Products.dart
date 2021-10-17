import 'dart:convert';
import 'package:flutter/cupertino.dart';

import 'Product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<Product> products = [];
  getProducts() async {
    var response = await http.get(Uri.parse('https://retail.amit-learning.com/api/products'));
    List lom = jsonDecode(response.body)['products'];
    for(var m in lom){
      Product myProduct = Product.fromJson(m);
      products.add(myProduct);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getProducts(),
        builder:(context,snapshot){
          return GridView.builder(itemBuilder: (context,index){
            return Column(
              children: [
                Container(
                    height: 200,
                    child: Image.network(products[index].image)),
                Text(products[index].title,overflow: TextOverflow.clip,),
                Text(products[index].name,overflow: TextOverflow.clip)
              ],
            );
          },
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
            ),
            itemCount: products.length);
        }
      ),
    );
  }
}
