// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blood_donation/admin/data/model/donor_info/donor_data.dart';

class SingleDonorData {
  final DonorData? data;
  final int? code;
  final String? message;
  final bool? error;

  SingleDonorData(this.data, this.code, this.message, this.error);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'data': data?.toJson(),
      'code': code,
      'message': message,
      'error': error,
    };
  }

  factory SingleDonorData.fromJson(Map<String, dynamic> map) {
    return SingleDonorData(
      map['data'] != null
          ? DonorData.fromJson(map['data'] as Map<String, dynamic>)
          : null,
      map['code'] != null ? map['code'] as int : null,
      map['message'] != null ? map['message'] as String : null,
      map['error'] != null ? map['error'] as bool : null,
    );
  }

  @override
  String toString() {
    return 'SingleDonorData(data: $data, code: $code, message: $message, error: $error)';
  }
}
