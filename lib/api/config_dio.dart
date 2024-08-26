import 'package:dio/dio.dart';

class InitDio {
  static Dio dio() {
    return Dio(
      BaseOptions(
        baseUrl: "http://8b0f-177-72-141-151.ngrok-free.app/",
        contentType: "application/json",
      ),
    );
  }
}
