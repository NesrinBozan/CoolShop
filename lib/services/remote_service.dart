import 'dart:convert';

import 'package:cool_shop/constant/string.dart';
import 'package:cool_shop/models/product.dart';
import 'package:http/http.dart' as http;


class RemoteService{

  static Future<List<Product>> fetchProducts()async{
   var client = http.Client();

   var product;

   try {
     var response = await client.get(Uri.parse(Strings.news_url));
     if (response.statusCode == 200) {
       var jsonString = response.body;
       var jsonMap = json.decode(jsonString);

       product = Product.fromJson(jsonMap);
     }
   } catch (Exception) {
     return product;
   }

   return product;
  }
}