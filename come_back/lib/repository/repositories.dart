import 'dart:convert';

import 'package:come_back/model/model.dart';
import 'package:http/http.dart';


class ProductRepository {

  
  String endpoint = 'https://dummyjson.com/products';
  Future<List<Product>>getProducts() async{
    Response response = await get(Uri.parse(endpoint));
    if(response.statusCode==200){
      final List <dynamic> data = jsonDecode(response.body)['products'];
      return data.map((e) => Product.fromJson(e)).toList();
    }else{
      throw Exception(response.reasonPhrase);
    }
  }

}