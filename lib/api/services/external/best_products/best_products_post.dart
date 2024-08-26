import 'package:brasa_hacks_stone/api/config_dio.dart';
import 'package:dio/dio.dart';

class PostBestProducts {
  static Future<List> fetch(String documentId) async {
    Dio dio = InitDio.dio();
    Response response = await dio.post(
      "api/best_items_by_document_id",
      data: {
        "document_id": documentId,
      },
    );
    return response.data["result"];
    print(response.data);
  }
}
