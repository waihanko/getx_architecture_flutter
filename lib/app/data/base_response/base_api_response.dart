import 'package:flutter/cupertino.dart';

class BaseApiResponse<T> {
  T? _objectResult;
  List<T>? _listResult;
  int? _statusCode;
  String? _message;

  dynamic get objectResult => _objectResult;

  dynamic get listResult => _listResult;

  int? get statusCode => _statusCode;

  String? get message => _message;

  BaseApiResponse(
      {dynamic objectResult,
      dynamic listResult,
      int? statusCode,
      String? message,}) {
    _objectResult = objectResult;
    _listResult = listResult;
    _statusCode = statusCode;
    _message = message;
  }

  factory BaseApiResponse.fromObjectJson(Map<String, dynamic> json,
      {@required Function(Map<String, dynamic>)? createObject}) {
    return BaseApiResponse<T>(
      objectResult:
          json["result"] != null ? createObject!(json["result"]) : null,
      statusCode: json["statusCode"],
      message: json["message"],
    );
  }

  factory BaseApiResponse.fromStringJson(
    Map<String, dynamic> json,
  ) {
    return BaseApiResponse<T>(
      objectResult: json["result"],
      statusCode: json["statusCode"],
      message: json["message"],
    );
  }

  factory BaseApiResponse.fromListJson(Map<String, dynamic> json,
      {Function(Map<String, dynamic>)? createList}) {
    var data = <T>[];
    json['result'].forEach((v) {
      data.add(createList!(v));
    });

    return BaseApiResponse<T>(
        statusCode: json["statusCode"],
        message: json["message"],
        listResult: data);
  }
}
