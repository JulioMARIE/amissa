import 'package:dio/dio.dart';
import 'package:missa/common/constants.dart';

class DioClient {
  static final _instance = DioClient._internal();
  Dio? dio;
  factory DioClient() {
    // ignore: unnecessary_null_comparison
    if (_instance == null) {
      return DioClient._internal();
    } else {
      return _instance;
    }
  }

   DioClient._internal() {
    dio = Dio(BaseOptions(
        baseUrl: Constant.basUrl,
        connectTimeout: 5000,
        receiveTimeout: 5000,
        ));
  }
}
