class UserModel {
  int? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  String? userPassword;
  int? verifyCode;
  int? usersApprove;
  String? usersCreate;
  int? branchCode;
  double? userFund;
  int? userType;

  UserModel(
      {this.userId,
        this.firstName,
        this.lastName,
        this.email,
        this.mobile,
        this.userPassword,
        this.verifyCode,
        this.usersApprove,
        this.usersCreate,
        this.branchCode,
        this.userFund,
        this.userType});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    mobile = json['mobile'];
    userPassword = json['user_password'];
    verifyCode = json['verify_code'];
    usersApprove = json['users_approve'];
    usersCreate = json['users_create'];
    branchCode = json['branch_code'];
    userFund = double.tryParse(json['user_fund'].toString());
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['mobile'] = mobile;
    data['user_password'] = userPassword;
    data['verify_code'] = verifyCode;
    data['users_approve'] = usersApprove;
    data['users_create'] = usersCreate;
    data['branch_code'] = branchCode;
    data['user_fund'] = userFund;
    data['user_type'] = userType;
    return data;
  }
}