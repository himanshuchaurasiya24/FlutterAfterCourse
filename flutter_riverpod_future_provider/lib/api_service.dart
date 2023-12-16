import 'dart:convert';

import 'package:flutter_riverpod_future_provider/user_model.dart';
import 'package:http/http.dart';

class ApiService {
  String endPoint = 'https://reqres.in/api/user?page=1';
  Future<List<UserModel>> getUser() async {
    Response response = await get(
      Uri.parse(endPoint),
    );
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e) => UserModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
