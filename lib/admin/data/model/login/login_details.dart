// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blood_donation/admin/data/model/login/login_data.dart';

class LoginDetails {
  final LoginData? data;
  final int? code;
  final String? message;
  final bool error;

  LoginDetails(this.data, this.code, this.message, this.error);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'data': data?.toJson(),
      'code': code,
      'message': message,
      'error': error,
    };
  }

  factory LoginDetails.fromJson(Map<String, dynamic> map) {
    return LoginDetails(
      map['data'] != null
          ? LoginData.fromJson(map['data'] as Map<String, dynamic>)
          : null,
      map['code'] != null ? map['code'] as int : null,
      map['message'] != null ? map['message'] as String : null,
      (map['error'] ?? false) as bool,
    );
  }

  @override
  String toString() {
    return 'LoginDetails(data: $data, code: $code, message: $message, error: $error)';
  }
}
