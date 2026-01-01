
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
  int? minutes;
  int? validDays;
  dynamic priceInDolar;
  dynamic priceInEgp;
  bool? hasDiscount;
  dynamic discount;
  dynamic discountPriceDolar;
  dynamic discountPriceEgp;
  List<Categories>? categories;
  String? createdAt;
  String? updatedAt;
  bool? isSubscribed;

  Data({this.id, this.name, this.minutes, this.validDays, this.priceInDolar, this.priceInEgp, this.hasDiscount, this.discount,
    this.discountPriceDolar, this.discountPriceEgp, this.categories, this.createdAt, this.updatedAt,this.isSubscribed});

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
    categories = json["categories"] == null ? null : (json["categories"] as List).map((e) => Categories.fromJson(e)).toList();
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    isSubscribed = json["is_subscribed"];
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
    if(categories != null) {
      _data["categories"] = categories?.map((e) => e.toJson()).toList();
    }
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["is_subscribed"] = isSubscribed;
    return _data;
  }
}

class Categories {
  int? id;
  String? nameAr;
  String? nameEn;

  Categories({this.id, this.nameAr, this.nameEn});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    nameAr = json["name_ar"];
    nameEn = json["name_en"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name_ar"] = nameAr;
    _data["name_en"] = nameEn;
    return _data;
  }
}