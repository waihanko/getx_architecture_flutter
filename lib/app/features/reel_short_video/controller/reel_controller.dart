import 'package:getx_architecture/app/constant/enum/view_state.dart';
import 'package:getx_architecture/app/core/base/base_controller.dart';
import 'package:getx_architecture/app/core/utils/app_utils.dart';
import 'package:getx_architecture/app/core/utils/pagination_utils.dart';
import 'package:getx_architecture/app/data_models/base_response/base_api_response.dart';
import 'package:getx_architecture/app/data_models/exception/base_exception.dart';
import 'package:getx_architecture/app/data_models/responses/dummy_list_response.dart';
import 'package:get/get.dart';
import 'package:getx_architecture/app/data_sources/network/sample_feature/sample_repository.dart';
import 'package:getx_architecture/app/data_sources/network/sample_feature/sample_repository_impl.dart';

class ReelController extends BaseController {
  late final SampleRepository _repository = SampleRepositoryImpl();
  RxList<Data> dummies = RxList.empty();

  late PaginationUtils samplePagination = PaginationUtils();

  @override
  void onInit() {
    super.onInit();
    getDummyList();
  }

  //#region API Call
  Future<void> resetAndGetDummyList() async {
    dummies.clear();
    samplePagination = PaginationUtils();
    getDummyList();
  }

  void getDummyList() async {
    if (samplePagination.isPageAvailable()) {
      final repoService = _repository.getDummyData();
      if (dummies.isEmpty) updatePageState(ViewState.LOADING);
      await callAPIService(
        repoService,
        onSuccess: _handleDummyListResponseSuccess,
        onError: _handleDummyListResponseError,
      );
    }
  }

  void _handleDummyListResponseSuccess(response) async {
    resetRefreshController(dummies);
    if (response != null) {
      BaseApiResponse<DummyListResponse> _orderData = response;

      DummyListResponse data = _orderData.objectResult;
      dummies.addAll(data.dummyList!);
      if (data.dummyList!.isEmpty) {
        Future.delayed(
          const Duration(seconds: 1),
          () => updatePageState(ViewState.EMPTYLIST),
        );
      }
      samplePagination.setCurrentPage(
        lastPage: data.pagination?.lastPage,
      );
    }
  }

  void _handleDummyListResponseError(BaseException exception) {
    resetRefreshController(dummies);
    if (dummies.isEmpty) {
      updatePageState(
        ViewState.FAILED,
        onClickTryAgain: () => resetAndGetDummyList(),
      );
    } else {
      AppUtils.showToast(exception.message);
    }
    return;
  }

}
