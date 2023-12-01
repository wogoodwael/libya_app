// ignore_for_file: non_constant_identifier_names

class SignUpModel {
  String first_name;
  String last_name;
  String email;
  String mobile;
  String user_password;
  int? users_approve;
  String users_create;
  SignUpModel(
      {required this.first_name,
      required this.last_name,
      required this.email,
      required this.mobile,
      required this.user_password,
      this.users_approve,
      required this.users_create});

  factory SignUpModel.fromJson(Map<String, dynamic> jsondata) {
    return SignUpModel(
        first_name: jsondata['userData']['first_name'],
        last_name: jsondata['userData']['last_name'],
        email: jsondata['userData']['email'],
        mobile: jsondata['userData']['mobile'],
        user_password: jsondata['userData']['user_password'],
        users_approve: jsondata['userData']['users_approve'],
        users_create: jsondata['userData']['users_create']);
  }
}
