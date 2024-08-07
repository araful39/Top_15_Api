import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mamun_api_practice/model/product_model.dart';

class ClassicItApiService {
  String baseUrl = "https://cit-ecommerce-codecanyon.bandhantrade.com";

// log In
    loginApi(String email, String pass) async {
   try{

     Response response = await http.post(Uri.parse('$baseUrl/api/login'),
         body: {"email_phone": email, "password": pass});

     if (response.statusCode == 200) {
       return true;
     }
   }
   catch (e){
log(e.toString());
   } return false;
  }

  //fetch Product
  static fetchProducts() async {
    Response response = await http.get(Uri.parse(
        "https://cit-ecommerce-codecanyon.bandhantrade.com/api/app/v1/products"));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      log("${json.runtimeType}");
      ProductListModel data = ProductListModel.fromJson(json);
      log("${data.runtimeType}");
      log("${data.products?.length}");
      return data.products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
