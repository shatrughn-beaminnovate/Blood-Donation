// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class LoginData {
  final int? bb_center;
  final String? access;
  final String? username;
  final String? lastname;
  final int? id;
  final String? token;
  final String? password;
  final String? email;
  final String? firstname;
  LoginData({
    this.bb_center,
    this.access,
    this.username,
    this.lastname,
    this.id,
    this.token,
    this.password,
    this.email,
    this.firstname,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'bb_center': bb_center,
      'access': access,
      'username': username,
      'lastname': lastname,
      'id': id,
      'token': token,
      'password': password,
      'email': email,
      'firstname': firstname,
    };
  }

  factory LoginData.fromJson(Map<String, dynamic> map) {
    return LoginData(
      bb_center: map['bb_center'] != null ? map['bb_center'] as int : null,
      access: map['access'] != null ? map['access'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      lastname: map['lastname'] != null ? map['lastname'] as String : null,
      id: map['id'] != null ? map['id'] as int : null,
      token: map['token'] != null ? map['token'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      firstname: map['firstname'] != null ? map['firstname'] as String : null,
    );
  }

  @override
  String toString() {
    return 'LoginData(bb_center: $bb_center, access: $access, username: $username, lastname: $lastname, id: $id, token: $token, password: $password, email: $email, firstname: $firstname)';
  }
}
