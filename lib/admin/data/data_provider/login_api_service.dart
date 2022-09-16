import 'dart:convert';

import 'package:blood_donation/admin/data/model/login/login_details.dart';
import 'package:blood_donation/admin/data/service/api_service.dart';
import 'package:dio/dio.dart';

import '../../../constant/admin/admin_constant.dart';
import '../service/api_interceptor.dart';

class LoginApiService {
  //get all list of donor
  Future<LoginDetails> getLoginData(String email, String password) async {
    Map<String, dynamic> data = {"email_id": email, "password": password};
    String body = json.encode(data);
    Response response = await ApiService.dio
        .post("$kDefaultAdminBaseUrl/v1/admin/login", data: body);

    if (response.statusCode == 200) {
      var data = LoginDetails.fromJson(response.data);
      //  print(data);
      return data;
    } else {
      throw BadRequestException(response.requestOptions);
    }
  }
}
