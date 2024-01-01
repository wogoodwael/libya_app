class ComplainsModel {
  int? complainId;
  int? complainUserid;
  String? complainBody;
  String? complainDate;

  ComplainsModel(
      {this.complainId,
        this.complainUserid,
        this.complainBody,
        this.complainDate});

  ComplainsModel.fromJson(Map<String, dynamic> json) {
    complainId = json['complain_id'];
    complainUserid = json['complain_userid'];
    complainBody = json['complain_body'];
    complainDate = json['complain_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['complain_id'] = this.complainId;
    data['complain_userid'] = this.complainUserid;
    data['complain_body'] = this.complainBody;
    data['complain_date'] = this.complainDate;
    return data;
  }
}