import 'package:getx_architecture/app/data/exception/base_exception.dart';

class NetworkException extends BaseException {
  NetworkException(String message) : super(message: message);
}
