
class PackagesModel {
  String? message;
  int? status;
  List<Data>? data;

  PackagesModel({this.message, this.status, this.data});

  PackagesModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    status = json["status"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    _data["status"] = status;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  int? id;
  String? name;
  dynamic minutes;
  dynamic validDays;
  dynamic priceInDolar;
  dynamic priceInEgp;
  bool? hasDiscount;
  dynamic discount;
  dynamic discountPriceDolar;
  dynamic discountPriceEgp;

  Data({this.id, this.name, this.minutes, this.validDays, this.priceInDolar, this.priceInEgp, this.hasDiscount, this.discount, this.discountPriceDolar, this.discountPriceEgp});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    minutes = json["minutes"];
    validDays = json["valid_days"];
    priceInDolar = json["price_in_dolar"];
    priceInEgp = json["price_in_egp"];
    hasDiscount = json["has_discount"];
    discount = json["discount"];
    discountPriceDolar = json["discount_price_dolar"];
    discountPriceEgp = json["discount_price_egp"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["minutes"] = minutes;
    _data["valid_days"] = validDays;
    _data["price_in_dolar"] = priceInDolar;
    _data["price_in_egp"] = priceInEgp;
    _data["has_discount"] = hasDiscount;
    _data["discount"] = discount;
    _data["discount_price_dolar"] = discountPriceDolar;
    _data["discount_price_egp"] = discountPriceEgp;
    return _data;
  }
}