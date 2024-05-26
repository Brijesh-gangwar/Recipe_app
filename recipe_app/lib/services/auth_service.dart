import 'package:recipe_app/models/user.dart';
import 'package:recipe_app/services/http.service.dart';

class authservice {
  static final authservice _singleton = authservice.internal();
  User? user;

  final _http_service = http_serivce();

  factory authservice() {
    return _singleton;
  }
  authservice.internal();

  Future<bool> login(String username, String password) async {
    try {
      final response = await _http_service.post(
          "https://dummyjson.com/auth/login",
          {"username": username, "password": password});

      print(response!.statusCode);

      if (response.statusCode == 200 && response.data != null) {
        user = User.fromJson(response.data);
        http_serivce().setup(bearertoken: user!.token);
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }
}
