import 'package:vost/data/remote/endpoints/parish_endpoints.dart';
import 'package:vost/data/remote/models/response/base_list_response.dart';

class ParishService {
  final ParishEndpoints _endpoints;

  ParishService(this._endpoints);

  Stream<BaseListResponse> getParishes() {
    return Stream.fromFuture(_endpoints.getParishes())
        .map((response) => BaseListResponse.fromJson(response.data));
  }
}
