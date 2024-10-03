import 'dart:convert';

import 'package:store_app/helper/Api.dart';
import 'package:store_app/model/prodects_model.dart';

class UpdateProdect_service {
  Future<ProdectModel> updateProdect({
    required dynamic id,
    required String title,
    required String price,
    required String descrption,
    required String category,
    required String image,
  }) async {
    Map<String, dynamic> data =
        await Api().put(url: 'https://fakestoreapi.com/prodects/$id', body: {
      'id': id,
      'title': title,
      'price': price,
      'description': descrption,
      'category': category,
      'image': image,
    });

    return ProdectModel.fromJson(data);
  }
}
