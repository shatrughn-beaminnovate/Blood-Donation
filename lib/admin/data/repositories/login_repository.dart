import 'dart:convert';

import 'package:blood_donation/admin/data/data_provider/login_api_service.dart';
import 'package:blood_donation/admin/data/model/login/login_details.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../model/login/login_data.dart';

class LoginRepository {
  final LoginApiService loginApiService = LoginApiService();

  final _tokenDataKey = "prmTokenDataKey";
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<LoginDetails> getLoginData(String email, String password) {
    return loginApiService.getLoginData(email, password);
  }

  // delete from local storage
  Future<void> deleteToken() async {
    // print("Deleting token");

    await storage.delete(key: _tokenDataKey);
    //  await Future.delayed(const Duration(seconds: 1));
    return;
  }

  // write to keystore/keychain
  Future<void> persistToken(LoginData loginData) async {
    print("Saving token");
    await storage.write(key: _tokenDataKey, value: json.encode(loginData));

    // await Future.delayed(const Duration(seconds: 1));

    return;
  }

  // read from keystore/keychain
  Future<bool> hasToken() async {
    var flag = await storage.read(key: _tokenDataKey);
    print("Reading token $flag");
    await Future.delayed(const Duration(seconds: 1));
    return flag != null;
  }

  //For getting data from local storage
  Future<String?> getTokenData() async {
    print("getting token");
    var data = await storage.read(key: _tokenDataKey);
    // await Future.delayed(const Duration(seconds: 1));
    return data;
  }
}
