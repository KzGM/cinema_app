import 'package:dio/dio.dart';

class DioClient {
  late Dio dio;

  final baseUrl = 'https://api.themoviedb.org/3';

  void initDio() {
    dio = Dio();
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: const Duration(seconds: 8),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.queryParameters
              .addAll({'api_key': '8248f913f083ee3fa4c08728c4c1923b'});
          return handler.next(options); //continue
        },
      ),
    );
  }
}
