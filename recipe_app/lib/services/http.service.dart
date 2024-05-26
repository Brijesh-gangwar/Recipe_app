import 'package:dio/dio.dart';
import 'package:recipe_app/constants.dart';

class http_serivce {
  static final http_serivce _singleton = http_serivce.internal();
  final dio = Dio();

  factory http_serivce() {
    return _singleton;
  }
  http_serivce.internal() {
    setup();
  }

  Future<void> setup({String? bearertoken}) async {
    final headers = {"Content-Type": "application/json"};
    final options = BaseOptions(
      baseUrl: api_url,
      headers: headers,
      validateStatus: (status) {
        if (status == null) return false;
        return status < 500;
      },
    );
    dio.options = options;
  }

  Future<Response?> post(String path, Map data) async {
    try {
      final response = await dio.post(path, data: data);
      return response;
    } catch (e) {
      print(e);
    }
  }
}
