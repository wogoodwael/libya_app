class OrdersModel {
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
  int? itemsPrice3;
  double? itemsPrice4;
  int? itemsPrice5;
  int? shopownerPrice;
  double? shopownerPrice2;
  int? shopownerPrice3;
  int? shopownerPrice4;
  int? shopownerPrice5;
  int? fornownerPrice;
  int? fornownerPrice2;
  int? fornownerPrice3;
  int? fornownerPrice4;
  int? fornownerPrice5;
  int? itemsDiscount;
  int? shopownerDiscount;
  int? fornownerDicount;
  String? itemsDate;
  int? itemsCat;
  String? branchCode;
  int? orderId;
  int? orderUserid;
  int? orderAddress;
  int? orderType;
  int? orderPricedelivery;
  int? orderPaymentMethod;
  double? orderPrice;
  double? orderTotalprice;
  double? orderAmountPaid;
  int? noOfInstallments;
  double? orderAmountRequired;
  int? orderStatus;
  String? orderBranch;
  String? orderDatetime;
  int? addressId;
  int? addressUserid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;

  OrdersModel(
      {this.itemsprice,
        this.itemsprice2,
        this.itemsprice3,
        this.itemsprice4,
        this.itemsprice5,
        this.shopownerprice,
        this.shopownerprice2,
        this.shopownerprice3,
        this.shopownerprice4,
        this.shopownerprice5,
        this.fornownerprice,
        this.fornownerprice2,
        this.fornownerprice3,
        this.fornownerprice4,
        this.fornownerprice5,
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
        this.shopownerDiscount,
        this.fornownerDicount,
        this.itemsDate,
        this.itemsCat,
        this.branchCode,
        this.orderId,
        this.orderUserid,
        this.orderAddress,
        this.orderType,
        this.orderPricedelivery,
        this.orderPaymentMethod,
        this.orderPrice,
        this.orderTotalprice,
        this.orderAmountPaid,
        this.noOfInstallments,
        this.orderAmountRequired,
        this.orderStatus,
        this.orderBranch,
        this.orderDatetime,
        this.addressId,
        this.addressUserid,
        this.addressName,
        this.addressCity,
        this.addressStreet,
        this.addressLat,
        this.addressLong});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    itemsprice = json['itemsprice'];
    itemsprice2 = json['itemsprice2'];
    itemsprice3 = json['itemsprice3'];
    itemsprice4 = json['itemsprice4'];
    itemsprice5 = json['itemsprice5'];
    shopownerprice = json['shopownerprice'];
    shopownerprice2 = json['shopownerprice2'];
    shopownerprice3 = json['shopownerprice3'];
    shopownerprice4 = json['shopownerprice4'];
    shopownerprice5 = json['shopownerprice5'];
    fornownerprice = json['fornownerprice'];
    fornownerprice2 = json['fornownerprice2'];
    fornownerprice3 = json['fornownerprice3'];
    fornownerprice4 = json['fornownerprice4'];
    fornownerprice5 = json['fornownerprice5'];
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
    itemsPrice = json['items_price'];
    itemsPrice2 = json['items_price2'];
    itemsPrice3 = json['items_price3'];
    itemsPrice4 = json['items_price4'];
    itemsPrice5 = json['items_price5'];
    shopownerPrice = json['shopowner_price'];
    shopownerPrice2 = json['shopowner_price2'];
    shopownerPrice3 = json['shopowner_price3'];
    shopownerPrice4 = json['shopowner_price4'];
    shopownerPrice5 = json['shopowner_price5'];
    fornownerPrice = json['fornowner_price'];
    fornownerPrice2 = json['fornowner_price2'];
    fornownerPrice3 = json['fornowner_price3'];
    fornownerPrice4 = json['fornowner_price4'];
    fornownerPrice5 = json['fornowner_price5'];
    itemsDiscount = json['items_discount'];
    shopownerDiscount = json['shopowner_discount'];
    fornownerDicount = json['fornowner_dicount'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    branchCode = json['branch_code'];
    orderId = json['order_id'];
    orderUserid = json['order_userid'];
    orderAddress = json['order_address'];
    orderType = json['order_type'];
    orderPricedelivery = json['order_pricedelivery'];
    orderPaymentMethod = json['order_paymentmethod'];
    orderPrice = double.parse(json['order_price'].toString());
    orderTotalprice = double.parse(json['order_totalprice'].toString());
    orderAmountPaid = double.parse(json['order_amount_paid'].toString());
    noOfInstallments = int.parse(json['no_of_installments'].toString());
    orderAmountRequired = double.parse(json['order_amount_required'].toString());
    orderStatus = json['order_status'];
    orderBranch = json['order_branch'];
    orderDatetime = json['order_datetime'];
    addressId = json['address_id'];
    addressUserid = json['address_userid'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['itemsprice'] = itemsprice;
    data['itemsprice2'] = itemsprice2;
    data['itemsprice3'] = itemsprice3;
    data['itemsprice4'] = itemsprice4;
    data['itemsprice5'] = itemsprice5;
    data['shopownerprice'] = shopownerprice;
    data['shopownerprice2'] = shopownerprice2;
    data['shopownerprice3'] = shopownerprice3;
    data['shopownerprice4'] = shopownerprice4;
    data['shopownerprice5'] = shopownerprice5;
    data['fornownerprice'] = fornownerprice;
    data['fornownerprice2'] = fornownerprice2;
    data['fornownerprice3'] = fornownerprice3;
    data['fornownerprice4'] = fornownerprice4;
    data['fornownerprice5'] = fornownerprice5;
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
    data['shopowner_discount'] = shopownerDiscount;
    data['fornowner_dicount'] = fornownerDicount;
    data['items_date'] = itemsDate;
    data['items_cat'] = itemsCat;
    data['branch_code'] = branchCode;
    data['order_id'] = orderId;
    data['order_userid'] = orderUserid;
    data['order_address'] = orderAddress;
    data['order_type'] = orderType;
    data['order_pricedelivery'] = orderPricedelivery;
    data['order_paymentmethod'] = orderPaymentMethod;
    data['order_price'] = orderPrice;
    data['order_totalprice'] = orderTotalprice;
    data['order_amount_paid'] = orderAmountPaid;
    data['no_of_installments'] = noOfInstallments;
    data['order_amount_required'] = orderAmountRequired;
    data['order_status'] = orderStatus;
    data['order_branch'] = orderBranch;
    data['order_datetime'] = orderDatetime;
    data['address_id'] = addressId;
    data['address_userid'] = addressUserid;
    data['address_name'] = addressName;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    return data;
  }
}