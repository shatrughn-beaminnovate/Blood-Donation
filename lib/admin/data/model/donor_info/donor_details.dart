// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'donor_data.dart';

class DonorDetails {
  final List<DonorData>? data;
  final int? code;
  final String? message;
  final bool? error;

  DonorDetails(this.data, this.code, this.message, this.error);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'data': data!.map((x) => x.toJson()).toList(),
      'code': code,
      'message': message,
      'error': error,
    };
  }

  factory DonorDetails.fromJson(Map<String, dynamic> map) {
    return DonorDetails(
      map['data'] != null
          ? List<DonorData>.from(
              (map['data'] as List<dynamic>).map<DonorData?>(
                (x) => DonorData.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
      map['code'] != null ? map['code'] as int : null,
      map['message'] != null ? map['message'] as String : null,
      map['error'] != null ? map['error'] as bool : null,
    );
  }

  @override
  String toString() {
    return 'DonorDetails(data: $data, code: $code, message: $message, error: $error)';
  }
}
