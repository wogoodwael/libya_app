class CartModel {
  double? itemsprice;
  double? itemsprice2;
  double? itemsprice3;
  double? itemsprice4;
  double? itemsprice5;
  double? shopownerprice;
  double? shopownerprice2;
  double? shopownerprice3;
  double? shopownerprice4;
  double? shopownerprice5;
  double? fornownerprice;
  double? fornownerprice2;
  double? fornownerprice3;
  double? fornownerprice4;
  double? fornownerprice5;
  int? countitems;
  int? cartId;
  int? cartUserid;
  int? cartItemid;
  int? cartOrders;
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

  CartModel(
      {this.itemsprice,
        this.itemsprice2,
        this.itemsprice3,
        this.itemsprice4,
        this.itemsprice5,
        this.countitems,
        this.cartId,
        this.cartUserid,
        this.cartItemid,
        this.cartOrders,
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
        this.branchCode});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemsprice = double.parse(json['itemsprice'].toString());
    itemsprice2 = double.parse(json['itemsprice2'].toString());
    itemsprice3 = double.parse(json['itemsprice3'].toString());
    itemsprice4 = double.parse(json['itemsprice4'].toString());
    itemsprice5 = double.parse(json['itemsprice5'].toString());
    shopownerprice = double.parse(json['shopownerprice'].toString());
    shopownerprice2 = double.parse(json['shopownerprice2'].toString());
    shopownerprice3 = double.parse(json['shopownerprice3'].toString());
    shopownerprice4 = double.parse(json['shopownerprice4'].toString());
    shopownerprice5 = double.parse(json['shopownerprice5'].toString());
    fornownerprice = double.parse(json['fornownerprice'].toString());
    fornownerprice2 = double.parse(json['fornownerprice2'].toString());
    fornownerprice3 = double.parse(json['fornownerprice3'].toString());
    fornownerprice4 = double.parse(json['fornownerprice4'].toString());
    fornownerprice5 = double.parse(json['fornownerprice5'].toString());
    countitems = json['countitems'];
    cartId = json['cart_id'];
    cartUserid = json['cart_userid'];
    cartItemid = json['cart_itemid'];
    cartOrders = json['cart_orders'];
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
    shopownerPrice =  double.parse(json['shopowner_price'].toString());
    shopownerPrice2 = double.parse(json['shopowner_price2'].toString());
    shopownerPrice3 = double.parse(json['shopowner_price3'].toString());
    shopownerPrice4 = double.parse(json['shopowner_price4'].toString());
    shopownerPrice5 = double.parse(json['shopowner_price5'].toString());
    fornownerPrice = double.parse(json['fornowner_price'].toString());
    fornownerPrice2 =double.parse(json['fornowner_price2'].toString());
    fornownerPrice3 =double.parse(json['fornowner_price3'].toString());
    fornownerPrice4 =double.parse(json['fornowner_price4'].toString());
    fornownerPrice5 = double.parse(json['fornowner_price5'].toString());
    itemsDiscount = json['items_discount'];
    shopownerDiscount = json['shopowner_discount'];
    fornownerDicount = json['fornowner_dicount'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    branchCode = json['branch_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsprice'] = itemsprice;
    data['itemsprice2'] = itemsprice2;
    data['itemsprice3'] = itemsprice3;
    data['itemsprice4'] = itemsprice4;
    data['itemsprice5'] = itemsprice5;
    data['countitems'] = countitems;
    data['cart_id'] = cartId;
    data['cart_userid'] = cartUserid;
    data['cart_itemid'] = cartItemid;
    data['cart_orders'] = cartOrders;
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_desc'] = itemsDesc;
    data['items_image'] = itemsImage;
    data['items_count'] = itemsCount;
    data['items_active'] = itemsActive;
    data['items_price'] = itemsPrice;
    data['items_price2'] = itemsPrice2;
    data['items_price3'] = itemsPrice3;
    data['items_price4'] = itemsPrice4;
    data['items_price5'] = itemsPrice5;
    data['shopowner_price'] = shopownerPrice;
    data['shopowner_price2'] = shopownerPrice2;
    data['shopowner_price3'] = shopownerPrice3;
    data['shopowner_price4'] = shopownerPrice4;
    data['shopowner_price5'] = shopownerPrice5;
    data['fornowner_price'] = fornownerPrice;
    data['fornowner_price2'] = fornownerPrice2;
    data['fornowner_price3'] = fornownerPrice3;
    data['fornowner_price4'] = fornownerPrice4;
    data['fornowner_price5'] = fornownerPrice5;
    data['items_discount'] = itemsDiscount;
    data['items_date'] = itemsDate;
    data['items_cat'] = itemsCat;
    data['branch_code'] = branchCode;
    return data;
  }
}