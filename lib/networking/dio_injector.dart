import 'package:dio/dio.dart';
import 'package:quick_start_flutter_bloc/utils/key_provider.dart';
import 'package:quick_start_flutter_bloc/utils/url_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioInjector {
  static final DioInjector _singleton = DioInjector._internal();
  Dio dio;

  factory DioInjector() {
    return _singleton;
  }

  DioInjector._internal();

  init(SharedPreferences prefs) {
    dio = Dio();
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 5000;

    dio.interceptors.add(
        LogInterceptor(responseBody: true, requestBody: true, request: true));

    dio.interceptors
      ..add(
        InterceptorsWrapper(
          onRequest:
              (RequestOptions options, RequestInterceptorHandler handler) {
            final authToken = prefs.getString(AUTH_TOKEN);
            print("authToken $authToken");
            if (options.extra["multipart"] == true) {
              options.headers = {
                "Authorization": "Basic $authToken",
                "JsonToken": "$authToken",
                "Content-Type": "multipart/form-data",
              };
            } else if (options.extra["removeHeader"] == true) {
              options.headers = {"content-type": "application/json"};
            } else {
              options.headers = {
                "Authorization": "Basic $authToken",
                "JsonToken": "$authToken",
                "content-type": "application/json"
              };
            }
            return options;
          },
        ),
      )
      ..add(LogInterceptor(
          responseBody: true,
          requestBody: true,
          request: false,
          responseHeader: false));
  }
}
