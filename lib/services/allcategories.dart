import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/prodects_model.dart';
import '../helper/Api.dart';

class AllCategoriesservice {
  Future<List<dynamic>> GetAllCatergories() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');

    return data;
  }
}
