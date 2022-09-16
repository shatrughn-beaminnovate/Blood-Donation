import 'package:blood_donation/admin/data/data_provider/login_api_service.dart';
import 'package:blood_donation/admin/data/model/login/login_details.dart';

class LoginRepository {
  final LoginApiService loginApiService = LoginApiService();

  Future<LoginDetails> getLoginData(String email, String password) {
    return loginApiService.getLoginData(email, password);
  }
}
