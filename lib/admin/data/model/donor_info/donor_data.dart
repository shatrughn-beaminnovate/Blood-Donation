// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

class DonorData {
  final String? donated_blood_date;
  final String? illness_specify;
  final String? job_business_state;
  final String? job_business_city;
  final String? state;
  final int? pincode;
  final int? mobile_no_2;
  final String? name;
  final int? id;
  final String? blood_donation_card;
  final String? donated_blood;
  final int? job_business_pin;
  final String? blood_group;
  final String? city;
  final String? current_address;
  final int? mobile_no_1;
  final String? donated_b_b_name;
  final String? email;
  final String? gender;
  final int? age;

  DonorData(
      this.donated_blood_date,
      this.illness_specify,
      this.job_business_state,
      this.job_business_city,
      this.state,
      this.pincode,
      this.mobile_no_2,
      this.name,
      this.id,
      this.blood_donation_card,
      this.donated_blood,
      this.job_business_pin,
      this.blood_group,
      this.city,
      this.current_address,
      this.mobile_no_1,
      this.donated_b_b_name,
      this.email,
      this.gender,
      this.age);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'donated_blood_date': donated_blood_date,
      'illness_specify': illness_specify,
      'job_business_state': job_business_state,
      'job_business_city': job_business_city,
      'state': state,
      'pincode': pincode,
      'mobile_no_2': mobile_no_2,
      'name': name,
      'id': id,
      'blood_donation_card': blood_donation_card,
      'donated_blood': donated_blood,
      'job_business_pin': job_business_pin,
      'blood_group': blood_group,
      'city': city,
      'current_address': current_address,
      'mobile_no_1': mobile_no_1,
      'donated_b_b_name': donated_b_b_name,
      'email': email,
      'gender': gender,
      'age': age,
    };
  }

  factory DonorData.fromJson(Map<String, dynamic> map) {
    return DonorData(
      map['donated_blood_date'] != null
          ? map['donated_blood_date'] as String
          : null,
      map['illness_specify'] != null ? map['illness_specify'] as String : null,
      map['job_business_state'] != null
          ? map['job_business_state'] as String
          : null,
      map['job_business_city'] != null
          ? map['job_business_city'] as String
          : null,
      map['state'] != null ? map['state'] as String : null,
      map['pincode'] != null ? map['pincode'] as int : null,
      map['mobile_no_2'] != null ? map['mobile_no_2'] as int : null,
      map['name'] != null ? map['name'] as String : null,
      map['id'] != null ? map['id'] as int : null,
      map['blood_donation_card'] != null
          ? map['blood_donation_card'] as String
          : null,
      map['donated_blood'] != null ? map['donated_blood'] as String : null,
      map['job_business_pin'] != null ? map['job_business_pin'] as int : null,
      map['blood_group'] != null ? map['blood_group'] as String : null,
      map['city'] != null ? map['city'] as String : null,
      map['current_address'] != null ? map['current_address'] as String : null,
      map['mobile_no_1'] != null ? map['mobile_no_1'] as int : null,
      map['donated_b_b_name'] != null
          ? map['donated_b_b_name'] as String
          : null,
      map['email'] != null ? map['email'] as String : null,
      map['gender'] != null ? map['gender'] as String : null,
      map['age'] != null ? map['age'] as int : null,
    );
  }

  @override
  String toString() {
    return 'DonorData(donated_blood_date: $donated_blood_date, illness_specify: $illness_specify, job_business_state: $job_business_state, job_business_city: $job_business_city, state: $state, pincode: $pincode, mobile_no_2: $mobile_no_2, name: $name, id: $id, blood_donation_card: $blood_donation_card, donated_blood: $donated_blood, job_business_pin: $job_business_pin, blood_group: $blood_group, city: $city, current_address: $current_address, mobile_no_1: $mobile_no_1, donated_b_b_name: $donated_b_b_name, email: $email, gender: $gender, age: $age)';
  }
}
