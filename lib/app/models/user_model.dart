class User {
  int? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  String? userPassword;
  int? userApprove;
  String? userCreateDate;
  int? branch_code;
  double? user_fund;
  int? user_type;

  User(
      { this.userId,
         this.firstName,
         this.lastName,
         this.email,
         this.mobile,
         this.userPassword,
         this.userApprove,
         this.userCreateDate,
         this.branch_code,
         this.user_fund,
         this.user_type,
      });

   User.fromJson(Map<String, dynamic> json) {
        userId = json['user_id'];
        firstName = json['first_name'];
        lastName =  json['last_name'];
        email =  json['email'];
        mobile =  json['mobile'];
        userPassword = json['user_password'];
        userApprove = json['users_approve'];
        userCreateDate = json['users_create'];
        branch_code = json['branch_code'];
        user_fund = double.parse(json['user_fund'].toString());
        user_type = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['email'] = email;
    _data['mobile'] = mobile;
    _data['user_password'] = userPassword;
    _data['users_approve'] = userApprove;
    _data['users_create'] = userCreateDate;
    _data['branch_code'] = branch_code;
    _data['user_fund'] = user_fund;
    _data['user_type'] = user_type;
    return _data;
  }
}