import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Product.dart';
class finalTest extends StatefulWidget {
  const finalTest({Key? key}) : super(key: key);

  @override
  _finalTestState createState() => _finalTestState();
}

class _finalTestState extends State<finalTest> {
  late List<Product> listOfProduct = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Testing API'),),
      body: FutureBuilder(
        future: getProducts(),
        builder: (context,snapshot){
          return ListView.builder(itemBuilder: (context,index){
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(listOfProduct[index].name)),
                Text(listOfProduct[index].price.toString()),
              ],
            );
          },
            itemCount: listOfProduct.length,
          );
        },

      )
    );
  }

  @override
  // void initState() {
  //   getProducts();
  // }

  getProducts()async{
    var response = await http.get(Uri.parse('https://retail.amit-learning.com/api/products'));
    if(response.statusCode ==200){
      print("get request Successfully");
    //  print(jsonDecode(response.body)['products']);
      var listOfMapsProducts = jsonDecode(response.body)['products'];
      print('length of list Of product before: ${listOfProduct.length}');

      for(var m in listOfMapsProducts){
        listOfProduct.add(Product.fromJson(m));
      }
      print('length of list Of product after: ${listOfProduct.length}');
      for(var v in listOfProduct){
        print("${v.name} ${v.price}");
      }

    }
  }
}
