class FavoriteModel {
  int? favoriteId;
  int? favoriteUsersid;
  String? favoriteBranchcode;
  int? favoriteItemsid;
  int? itemsId;
  String? itemsName;
  String? itemsDesc;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  double? itemsPrice;
  double? itemsPrice2;
  double? itemsPrice3;
  double? itemsPrice4;
  double? itemsPrice5;
  double? shopownerPrice;
  double? shopownerPrice2;
  double? shopownerPrice3;
  double? shopownerPrice4;
  double? shopownerPrice5;
  double? fornownerPrice;
  double? fornownerPrice2;
  double? fornownerPrice3;
  double? fornownerPrice4;
  double? fornownerPrice5;
  int? itemsDiscount;
  String? itemsDate;
  int? itemsCat;
  String? branchCode;
  int? userId;

  FavoriteModel(
      {this.favoriteId,
        this.favoriteUsersid,
        this.favoriteBranchcode,
        this.favoriteItemsid,
        this.itemsId,
        this.itemsName,
        this.itemsDesc,
        this.itemsImage,
        this.itemsCount,
        this.itemsActive,
        this.itemsPrice,
        this.itemsPrice2,
        this.itemsPrice3,
        this.itemsPrice4,
        this.itemsPrice5,
        this.shopownerPrice,
        this.shopownerPrice2,
        this.shopownerPrice3,
        this.shopownerPrice4,
        this.shopownerPrice5,
        this.fornownerPrice,
        this.fornownerPrice2,
        this.fornownerPrice3,
        this.fornownerPrice4,
        this.fornownerPrice5,
        this.itemsDiscount,
        this.itemsDate,
        this.itemsCat,
        this.branchCode,
        this.userId});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUsersid = json['favorite_usersid'];
    favoriteBranchcode = json['favorite_branchcode'];
    favoriteItemsid = json['favorite_itemsid'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsDesc = json['items_desc'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = double.parse(json['items_price'].toString());
    itemsPrice2 = double.parse(json['items_price2'].toString());
    itemsPrice3 = double.parse(json['items_price3'].toString());
    itemsPrice4 = double.parse(json['items_price4'].toString());
    itemsPrice5 = double.parse(json['items_price5'].toString());
    shopownerPrice = double.parse(json['shopowner_price'].toString());
    shopownerPrice2 = double.parse(json['shopowner_price2'].toString());
    shopownerPrice3 = double.parse(json['shopowner_price3'].toString());
    shopownerPrice4 = double.parse(json['shopowner_price4'].toString());
    shopownerPrice5 = double.parse(json['shopowner_price5'].toString());
    fornownerPrice = double.parse(json['fornowner_price'].toString());
    fornownerPrice2 = double.parse(json['fornowner_price2'].toString());
    fornownerPrice3 = double.parse(json['fornowner_price3'].toString());
    fornownerPrice4 = double.parse(json['fornowner_price4'].toString());
    fornownerPrice5 = double.parse(json['fornowner_price5'].toString());
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    branchCode = json['branch_code'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteId;
    data['favorite_usersid'] = this.favoriteUsersid;
    data['favorite_branchcode'] = this.favoriteBranchcode;
    data['favorite_itemsid'] = this.favoriteItemsid;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_desc'] = this.itemsDesc;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_price2'] = this.itemsPrice2;
    data['items_price3'] = this.itemsPrice3;
    data['items_price4'] = this.itemsPrice4;
    data['items_price5'] = this.itemsPrice5;
    data['shopowner_price'] = this.shopownerPrice;
    data['shopowner_price2'] = this.shopownerPrice2;
    data['shopowner_price3'] = this.shopownerPrice3;
    data['shopowner_price4'] = this.shopownerPrice4;
    data['shopowner_price5'] = this.shopownerPrice5;
    data['fornowner_price'] = this.fornownerPrice;
    data['fornowner_price2'] = this.fornownerPrice2;
    data['fornowner_price3'] = this.fornownerPrice3;
    data['fornowner_price4'] = this.fornownerPrice4;
    data['fornowner_price5'] = this.fornownerPrice5;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    data['branch_code'] = this.branchCode;
    data['user_id'] = this.userId;
    return data;
  }
}