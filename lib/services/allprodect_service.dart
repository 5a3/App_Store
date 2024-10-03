import 'dart:convert';
import 'package:http/http.dart';
import 'package:store_app/model/prodects_model.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/helper/Api.dart';

class allprodect_service {
  Future<List<ProdectModel>> GetAllProdect() async {
    List<dynamic> data =
        await Api().get(url: "https://fakestoreapi.com/products");

    List<ProdectModel> listprodect = [];

    for (int i = 0; i < data.length; i++) {
      listprodect.add(ProdectModel.fromJson(data[i]));
    }
    return listprodect;
  }
}
