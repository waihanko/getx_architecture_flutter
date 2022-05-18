import 'dart:async';
import 'dart:io';

import 'package:getx_architecture/app/core/utils/app_utils.dart';
import 'package:getx_architecture/app/data/exception/api_exception.dart';
import 'package:getx_architecture/app/data/exception/app_exception.dart';
import 'package:getx_architecture/app/data/exception/network_exception.dart';
import 'package:getx_architecture/app/data/exception/service_unavailable_exception.dart';
import 'package:getx_architecture/app/data/local/cache_manager.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../exception/not_found_exception.dart';

Exception handleError(String error) {
  return AppException(message: error);
}

Exception handleDioError(DioError dioError) {
  switch (dioError.type) {
    case DioErrorType.cancel:
      return AppException(message: "Request to API server was cancelled");
    case DioErrorType.connectTimeout:
      return AppException(message: "Connection timeout with API server");
    case DioErrorType.other:
      return AppException(message: dioError.message);
    case DioErrorType.receiveTimeout:
      return TimeoutException("Receive timeout in connection with API server");
    case DioErrorType.sendTimeout:
      return TimeoutException("Send timeout in connection with API server");
    case DioErrorType.response:
      return _parseDioErrorResponse(dioError);
  }
}

Exception _parseDioErrorResponse(DioError dioError) {
  int statusCode = dioError.response?.statusCode ?? -1;
  String? serverMessage;
  try {
    if (statusCode == -1 || statusCode == HttpStatus.ok) {
      statusCode = dioError.response?.data["statusCode"];
    } else if (dioError.response?.data["statusCode"] == 40101 ||
        dioError.response?.data["statusCode"] == 40102 ||
        dioError.response?.data["statusCode"] == 401) {
      Get.find<CacheManager>().clearAllData();
      AppUtils.showToast("Unauthorized: Please login again");
      print("*****Unauthourized****");
      // if (!AppUtils.isLogout) {
      //   Get.offAllNamed(
      //     Paths.LOGIN,
      //   );
      // }
      // AppUtils.isLogout = true;
    }
    serverMessage = dioError.response?.data["message"];
  } catch (e, s) {
    serverMessage = "Something went wrong. Please try again later.";
  }

  switch (statusCode) {
    case HttpStatus.serviceUnavailable:
      return ServiceUnavailableException("Service Temporarily Unavailable");
    case HttpStatus.notFound:
      return NotFoundException(serverMessage ?? "", "Not Found");
    default:
      return ApiException(
        httpCode: statusCode,
        status: "Not found",
        message: serverMessage ?? "",
      );
  }
}
