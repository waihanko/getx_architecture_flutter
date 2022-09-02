import 'package:getx_architecture/app/data_models/exception/base_exception.dart';

class JsonFormatException extends BaseException {
  JsonFormatException(String message) : super(message: message);
}
