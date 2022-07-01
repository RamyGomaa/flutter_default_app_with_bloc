import 'dart:convert';
import 'dart:developer';

import '../../../../core/data/api_constants.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;

class UserApiService {
  static Future<List<UserModel>?> getUsers() async {
    try {
      var response = await UserApiService._get(
          ApiConstants.baseUrl + ApiConstants.usersEndPoint);
      if (response != null) {
        List<UserModel> _model = [];
        List<dynamic> fetchedData =
            (json.decode(utf8.decode(response.bodyBytes))) as List<dynamic>;
        for (var element in fetchedData) {
          _model.add(UserModel.fromJson(element));
        }
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<http.Response?> _get(String httpUrl) async {
    try {
      var url = Uri.parse(httpUrl);
      var response = await http.get(url);
      if (response.statusCode < 300) {
        return response;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
