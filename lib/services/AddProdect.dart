import 'package:store_app/helper/Api.dart';
import 'package:store_app/model/prodects.dart';
import 'package:store_app/model/prodects_model.dart';
import 'package:http/http.dart' as http;
import '';

class AddProdectservice {
  Future<ProdectModel> addProdect({
    required String title,
    required String price,
    required String descrption,
    required String category,
    required String image,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': '${title}',
        'price': '${price}',
        'description': '${descrption}',
        'category': '${category}',
        'image': '${image}',
      },
    );
    print(data);
    return ProdectModel.fromJson(data);
  }
}
