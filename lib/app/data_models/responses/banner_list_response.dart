
class BannerListResponse {
  BannerListResponse({
    this.banners,
    this.status,
    this.message,
    this.error,
  });

  BannerListResponse.fromJson(dynamic json) {
    if (json['data_models'] != null) {
      banners = [];
      json['data_models'].forEach((v) {
        banners?.add(Banners.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
    error = json['error'] != null ? json['error'].cast<String>() : [];
  }

  List<Banners>? banners;
  bool? status;
  String? message;
  List<String>? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (banners != null) {
      map['data_models'] = banners?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['message'] = message;
    map['error'] = error;
    return map;
  }
}

class Banners {
  Banners({
    this.id,
    this.image,
  });

  Banners.fromJson(dynamic json) {
    id = json['id'];
    image = "BASE_URL" + json['image'];
  }

  int? id;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    return map;
  }
}
