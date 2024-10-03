import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/model/prodects.dart';

class S_prodect {
  Future<List<Prodects>> GetProdects() async {
    var url = 'https://api.escuelajs.co/api/v1/products';
    http.Response response = await http.get(Uri.parse(url));

    List<dynamic> data = jsonDecode(response.body);
    List<Prodects> listProdects = [];
    for (int i = 0; i < data.length; i++) {
      listProdects.add(Prodects.fromJson(data[i]));
    }
    print(listProdects);
    return listProdects;
  }
}
