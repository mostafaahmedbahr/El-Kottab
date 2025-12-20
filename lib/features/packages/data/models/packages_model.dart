
class PackagesModel {
  String? message;
  int? status;
  List<Data>? data;

  PackagesModel({this.message, this.status, this.data});

  PackagesModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    status = (json["status"] as num).toInt();
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
  String? validDays;
  String? price;

  Data({this.id, this.name, this.minutes, this.validDays, this.price});

  Data.fromJson(Map<String, dynamic> json) {
    id = (json["id"] as num).toInt();
    name = json["name"];
    minutes = (json["minutes"] as num).toInt();
    validDays = json["valid_days"];
    price = json["price"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["minutes"] = minutes;
    _data["valid_days"] = validDays;
    _data["price"] = price;
    return _data;
  }
}