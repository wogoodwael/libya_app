class ItemsModel {
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
  int? shopownerDiscount;
  int? fornownerDicount;
  String? itemsDate;
  int? itemsCat;
  String? branchCode;
  int? categoriesId;
  String? categoriesName;
  String? categoriesImage;
  String? categoriesDatatime;
  double? itemspricediscount;
  double? itemspricediscount2;
  double? itemspricediscount3;
  double? itemspricediscount4;
  double? itemspricediscount5;
  double? shopownerPriceDiscount;
  double? shopownerPriceDiscount2;
  double? shopownerPriceDiscount3;
  double? shopownerPriceDiscount4;
  double? shopownerPriceDiscount5;
  double? fornownerPriceDiscount;
  double? fornownerPriceDiscount2;
  double? fornownerPriceDiscount3;
  double? fornownerPriceDiscount4;
  double? fornownerPriceDiscount5;

  ItemsModel(
      {this.itemsId,
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
        this.shopownerDiscount,
        this.fornownerDicount,
        this.itemsDate,
        this.itemsCat,
        this.branchCode,
        this.categoriesId,
        this.categoriesName,
        this.categoriesImage,
        this.categoriesDatatime,
        this.itemspricediscount,
        this.itemspricediscount2,
        this.itemspricediscount3,
        this.itemspricediscount4,
        this.itemspricediscount5,
        this.shopownerPriceDiscount,
        this.shopownerPriceDiscount2,
        this.shopownerPriceDiscount3,
        this.shopownerPriceDiscount4,
        this.shopownerPriceDiscount5,
        this.fornownerPriceDiscount,
        this.fornownerPriceDiscount2,
        this.fornownerPriceDiscount3,
        this.fornownerPriceDiscount4,
        this.fornownerPriceDiscount5,
      });

  ItemsModel.fromJson(Map<String, dynamic> json) {
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
    shopownerDiscount = json['shopowner_discount'];
    fornownerDicount = json['fornowner_discount'] ?? 0;
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    branchCode = json['branch_code'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesImage = json['categories_image'];
    categoriesDatatime = json['categories_datatime'];
    itemspricediscount = double.tryParse(json['itemspricediscount'].toString());
    itemspricediscount2 = double.tryParse(json['itemspricediscount2'].toString());
    itemspricediscount3 = double.tryParse(json['itemspricediscount3'].toString());
    itemspricediscount4 = double.tryParse(json['itemspricediscount4'].toString());
    itemspricediscount5 = double.tryParse(json['itemspricediscount5'].toString());
    shopownerPriceDiscount = double.tryParse(json['shopowner_price_discount'].toString());
    shopownerPriceDiscount2 = double.tryParse(json['shopowner_price_discount2'].toString());
    shopownerPriceDiscount3 = double.tryParse(json['shopowner_price_discount3'].toString());
    shopownerPriceDiscount4 = double.tryParse(json['shopowner_price_discount4'].toString());
    shopownerPriceDiscount5 = double.tryParse(json['shopowner_price_discount5'].toString());
    fornownerPriceDiscount = double.tryParse(json['fornowner_price_discount'].toString());
    fornownerPriceDiscount2 = double.tryParse(json['fornowner_price_discount2'].toString());
    fornownerPriceDiscount3 = double.tryParse(json['fornowner_price_discount3'].toString());
    fornownerPriceDiscount4 = double.tryParse(json['fornowner_price_discount4'].toString());
    fornownerPriceDiscount5 = double.tryParse(json['fornowner_price_discount5'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_image'] = this.categoriesImage;
    data['categories_datatime'] = this.categoriesDatatime;
    data['itemspricediscount'] = this.itemspricediscount;
    data['itemspricediscount2'] = this.itemspricediscount2;
    data['itemspricediscount4'] = this.itemspricediscount3;
    data['itemspricediscount4'] = this.itemspricediscount4;
    data['itemspricediscount5'] = this.itemspricediscount5;
    return data;
  }
}