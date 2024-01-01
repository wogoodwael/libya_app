class ComplainsModel {
  int? complainId;
  int? complainUserid;
  String? complainBody;
  int? complainBranch;
  String? complainDate;
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
  int? userFund;
  int? userType;

  ComplainsModel(
      {this.complainId,
        this.complainUserid,
        this.complainBody,
        this.complainBranch,
        this.complainDate,
        this.userId,
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

  ComplainsModel.fromJson(Map<String, dynamic> json) {
    complainId = json['complain_id'];
    complainUserid = json['complain_userid'];
    complainBody = json['complain_body'];
    complainBranch = json['complain_branch'];
    complainDate = json['complain_date'];
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
    userFund = json['user_fund'];
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['complain_id'] = complainId;
    data['complain_userid'] = complainUserid;
    data['complain_body'] = complainBody;
    data['complain_branch'] = complainBranch;
    data['complain_date'] = complainDate;
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