import 'dart:convert';
import 'package:store_app/model/prodects_model.dart';
import 'package:http/http.dart' as http;
import '../helper/Api.dart';

class allprodectcatogries_service {
  Future<List<ProdectModel>> GetAllProdectCatogries(
      {String? CatogryName}) async {
    if (CatogryName != null) {
      List<dynamic> data = await Api().get(
          url: "https://fakestoreapi.com/products/category/${CatogryName}");
      List<ProdectModel> listprodect = [];
      for (int i = 0; i < data.length; i++) {
        listprodect.add(ProdectModel.fromJson(data[i]));
      }
      return listprodect;
    } else {
      List<dynamic> data =
          await Api().get(url: "https://fakestoreapi.com/products");
      List<ProdectModel> listprodect = [];
      for (int i = 0; i < data.length; i++) {
        listprodect.add(ProdectModel.fromJson(data[i]));
      }
      return listprodect;
    }
  }
}
