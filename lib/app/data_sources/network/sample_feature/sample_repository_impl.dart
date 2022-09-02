import 'package:dio/dio.dart';
import 'package:getx_architecture/app/core/base/base_remote_source.dart';
import 'package:getx_architecture/app/data_models/base_response/base_api_response.dart';
import 'package:getx_architecture/app/data_models/responses/dummy_list_response.dart';
import 'package:getx_architecture/app/data_sources/network/sample_feature/sample_repository.dart';

class SampleRepositoryImpl extends BaseRemoteSource
    implements SampleRepository {
  @override
  Future<BaseApiResponse<DummyListResponse>> getDummyData() async {
    var endpoint = "https://jsonkeeper.com/b/OGXT";
    var dioCall = dioClient.get(endpoint);
    try {
      return callApiWithErrorParser(dioCall).then(
        (response) => _parseBannerResponse(response),
      );
    } catch (e) {
      rethrow;
    }
  }

  BaseApiResponse<DummyListResponse> _parseBannerResponse(Response response) {
    return BaseApiResponse<DummyListResponse>.fromObjectJson(response.data,
        createObject: (data) => DummyListResponse.fromJson(data));
  }
}
