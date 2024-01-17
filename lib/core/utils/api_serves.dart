import 'package:dio/dio.dart';

class ApiServes {
  final Dio dio;
  ApiServes(this.dio);
  final String _BASE_URL = 'http://10.0.2.2:8080/wordpress/wp-json/wp/v2/';
  Future<dynamic> auth(
      {required String endPoint,
      required String username,
      required String password}) async {
    const String _PASE_Auth_URL =
        'http://10.0.2.2:8080/wordpress/wp-json/jwt-auth/v1/';
    Response response = await dio.post(
      '$_PASE_Auth_URL$endPoint',
      queryParameters: {
        'username': username,
        'password': password,
      },
    );
    return response.data;
  }

  Future<dynamic> get(String endPoint) async {
    Response response = await dio.get('$_BASE_URL$endPoint');
    return response.data;
  }

  Future<dynamic> delete(
      {required String endPoint, required String token}) async {
    Response response = await dio.delete(
      '$_BASE_URL$endPoint',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return response.data;
  }
}
