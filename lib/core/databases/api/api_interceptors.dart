import 'package:dio/dio.dart';
import '../../common/logs.dart';
import '../../constants/app_constants.dart';
import '../../services/service_locator.dart';
import '../cache/cache_helper.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    // Token Will be added here to the header if it is not null.
    options.headers["Authorization"] =
        sl<CacheHelper>().getData(key: AppConstants.token) != null
            ? 'Bearer ${sl<CacheHelper>().getData(key: AppConstants.token)}'
            : null;

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    printGreen('Response: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    printRed('Error: ${err.response?.data}');
    super.onError(err, handler);
  }
}
