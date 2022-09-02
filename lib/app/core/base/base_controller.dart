import 'package:getx_architecture/app/constant/enum/view_state.dart';
import 'package:getx_architecture/app/data_models/exception/api_exception.dart';
import 'package:getx_architecture/app/data_models/exception/app_exception.dart';
import 'package:getx_architecture/app/data_models/exception/base_exception.dart';
import 'package:getx_architecture/app/data_models/exception/json_format_exception.dart';
import 'package:getx_architecture/app/data_models/exception/network_exception.dart';
import 'package:getx_architecture/app/data_models/exception/service_unavailable_exception.dart';
import 'package:getx_architecture/app/data_models/exception/timeout_exception.dart';
import 'package:getx_architecture/app/data_models/exception/unauthorize_exception.dart';
import 'package:getx_architecture/app/data_sources/local/cache_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_architecture/app/services/socket_service.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../../data_models/exception/not_found_exception.dart';

abstract class BaseController extends GetxController
    with CacheManager, GetSingleTickerProviderStateMixin {
  final logoutController = false.obs;

  //Reload the page
  RefreshController _refreshController = RefreshController();

  RefreshController get refreshController => _refreshController;

  io.Socket? socket;

  //Controls page state
  final Rx<PageStateHandler> _pageSateController =
      PageStateHandler(ViewState.DEFAULT).obs;

  PageStateHandler get pageState => _pageSateController.value;

  updatePageState(ViewState state, {Function? onClickTryAgain}) =>
      _pageSateController(PageStateHandler(state, onClickTryAgain: onClickTryAgain));

  dynamic callAPIService<T>(
    Future<T> future, {
    Function(BaseException exception)? onError,
    Function(T response)? onSuccess,
    Function? onStart,
    Function? onComplete,
  }) async {
    onStart != null ? onStart() : null;
    try {
      final T response = await future;
      if (onSuccess != null) onSuccess(response);
      updatePageState(ViewState.SUCCESS);
      return response;
    } on ServiceUnavailableException catch (exception) {
      _showErrorMessage(exception, onError);
    } on UnauthorizedException catch (exception) {
      _showErrorMessage(exception, onError);
    } on TimeoutException catch (exception) {
      _showErrorMessage(exception, onError);
    } on NetworkException catch (exception) {
      _showErrorMessage(exception, onError);
    } on JsonFormatException catch (exception) {
      _showErrorMessage(exception, onError);
    } on NotFoundException catch (exception) {
      _showErrorMessage(exception, onError);
    } on ApiException catch (exception) {
      _showErrorMessage(exception, onError);
    } on AppException catch (exception) {
      _showErrorMessage(exception, onError);
    } catch (error, s) {
      _showErrorMessage(AppException(message: "$error"), onError);
      debugPrint("Controller>>>>>> error $s");
    }
  }

  _showErrorMessage(BaseException exception, onError) {
    _errorMessageController(exception.message);
    onError!(exception);
  }

  final RxString _messageController = ''.obs;

  final RxString _errorMessageController = ''.obs;

  final RxString _successMessageController = ''.obs;

  String get message => _messageController.value;

  String get errorMessage => _errorMessageController.value;

  String get successMessage => _messageController.value;

  showMessage(String msg) => _messageController(msg);

  showErrorMessage(String msg) => _errorMessageController(msg);

  showSuccessMessage(String msg) => _successMessageController(msg);

  void setRefreshController(RefreshController refreshController) {
    _refreshController = refreshController;
  }


  void resetRefreshController<T>(RxList<T> dataList) {
    if (_refreshController.isRefresh) {
      dataList.clear();
      _refreshController.refreshCompleted();
    }
    if (_refreshController.isLoading) {
      _refreshController.loadComplete();
    }
  }

  @override
  void onInit() {
    super.onInit();
    initSocket();
  }

  void initSocket() {
    // if (getToken() != null) {
    //   socket = getSocketInstance();
    // }
  }

  getSocketInstance() {
    return SocketService.instance.initSocket();
  }


  @override
  void onClose() {
    _messageController.close();
    _refreshController.dispose();
    _pageSateController.close();
    super.onClose();
  }
}

class PageStateHandler {
  final ViewState viewState;
  final Function? onClickTryAgain;

  PageStateHandler(
    this.viewState, {
    this.onClickTryAgain,
  });
}
