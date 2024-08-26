import 'package:brasa_hacks_stone/api/config_dio.dart';
import 'package:dio/dio.dart';

class PostBestMccPerState {
  Future<List> fetch(String state) async {
    try {
      Dio dio = await InitDio.dio();
      print(dio.options.baseUrl);
      Response response = await dio.post(
        "api/best_mcc_per_state",
        options: Options(
          contentType: "application/json",
        ),
        data: {
          "state": state,
        },
      );
      print(response);
      return response.data["result"];
    } catch (e) {
      return [];
    }
  }
}
