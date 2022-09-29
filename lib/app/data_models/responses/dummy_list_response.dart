class DummyListResponse {
  DummyListResponse({
      this.dummyList,
      this.pagination, 
      this.statusCode, 
      this.message,});

  DummyListResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      dummyList = [];
      json['data'].forEach((v) {
        dummyList?.add(Data.fromJson(v));
      });
    }
    pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
    statusCode = json['statusCode'];
    message = json['message'];
  }
  List<Data>? dummyList;
  Pagination? pagination;
  int? statusCode;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (dummyList != null) {
      map['data'] = dummyList?.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      map['pagination'] = pagination?.toJson();
    }
    map['statusCode'] = statusCode;
    map['message'] = message;
    return map;
  }

}

class Pagination {
  Pagination({
      this.lastPage, 
      this.currentPage, 
      this.perPage, 
      this.totalItems,
  });

  Pagination.fromJson(dynamic json) {
    lastPage = json['lastPage'];
    currentPage = json['currentPage'];
    perPage = json['perPage'];
    totalItems = json['totalItems'];
  }
  int? lastPage;
  int? currentPage;
  int? perPage;
  int? totalItems;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lastPage'] = lastPage;
    map['currentPage'] = currentPage;
    map['perPage'] = perPage;
    map['totalItems'] = totalItems;
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.name,
      this.video,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    video = json['video'];
  }
  int? id;
  String? name;
  String? video;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['video'] = name;
    return map;
  }

}