class DummyListResponse {
  DummyListResponse({
      List<Data>? data,
    Pagination? pagination,}){
    _data = data;
    _pagination = pagination;

  }

  DummyListResponse.fromJson(dynamic json) {
    if (json['data_models'] != null) {
      _data = [];
      json['data_models'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  List<Data>? _data;

  Pagination? _pagination;

  List<Data>? get dummyList => _data;

  Pagination? get pagination => _pagination;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data_models'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      int? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  int? _id;
  String? _name;

  int? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}

class Pagination {
  Pagination({
    int? lastPage,
    int? currentPage,
    int? perPage,
    int? totalItems,
  }) {
    _lastPage = lastPage;
    _currentPage = currentPage;
    _perPage = perPage;
    _totalItems = totalItems;
  }

  Pagination.fromJson(dynamic json) {
    _lastPage = json['lastPage'];
    _currentPage = json['currentPage'];
    _perPage = json['perPage'];
    _totalItems = json['totalItems'];
  }

  int? _lastPage;
  int? _currentPage;
  int? _perPage;
  int? _totalItems;

  int? get lastPage => _lastPage;

  int? get currentPage => _currentPage;

  int? get perPage => _perPage;

  int? get totalItems => _totalItems;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lastPage'] = _lastPage;
    map['currentPage'] = _currentPage;
    map['perPage'] = _perPage;
    map['totalItems'] = _totalItems;
    return map;
  }
}
