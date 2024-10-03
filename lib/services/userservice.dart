import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/model/users.dart';

class s_user {
  Future<List<Users>> getusers() async {
    var url = 'https://api.escuelajs.co/api/v1/users';
    http.Response response = await http.get(Uri.parse(url));

    List<dynamic> data = jsonDecode(response.body);
    List<Users> listusers = [];
    for (int i = 0; i < data.length; i++) {
      listusers.add(Users.fromJson(data[i]));
    }
    print(listusers);
    return listusers;
  }
}
