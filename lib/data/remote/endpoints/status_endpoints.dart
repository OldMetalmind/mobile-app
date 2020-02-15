import 'package:dio/dio.dart';

import 'package:vost/constants.dart';

class StatusEndpoints {
  final Dio _dio;

  StatusEndpoints(this._dio);

  Future<Response> getStatuses() {
    return _dio.get(pathStatuses);
  }
}
