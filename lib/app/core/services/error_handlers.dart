import 'dart:async';
import 'dart:io';

import 'package:getx_architecture/app/core/utils/app_utils.dart';
import 'package:getx_architecture/app/data_models/exception/api_exception.dart';
import 'package:getx_architecture/app/data_models/exception/app_exception.dart';
import 'package:getx_architecture/app/data_models/exception/not_found_exception.dart';
import 'package:getx_architecture/app/data_models/exception/service_unavailable_exception.dart';
import 'package:getx_architecture/app/data_sources/local/cache_manager.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';


Exception handleError(String error) {
  return AppException(message: error);
}

Exception handleDioError(DioException dioError) {
  switch (dioError.type) {
    case DioExceptionType.cancel:
      return AppException(message: "Request to API server was cancelled");
    case DioExceptionType.receiveTimeout:
      return AppException(message: "Connection timeout with API server");
    case DioExceptionType.sendTimeout:
      return AppException(message:"Connection timeout with API server");
    case DioExceptionType.badCertificate:
      return TimeoutException("Bad Certificate");
    case DioExceptionType.connectionError:
      return _parseDioErrorResponse(dioError);
    case DioExceptionType.connectionTimeout:
      return AppException(message:"Connection timeout with API server");      break;
    case DioExceptionType.badResponse:
      return AppException(message:"Connection timeout with API server");      break;
    case DioExceptionType.unknown:
      return AppException(message:"Connection timeout with API server");      break;
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
