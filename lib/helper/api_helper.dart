import 'dart:convert';
import 'dart:developer';
import 'package:fakestore/mode/model.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  Future<List<ApiModel>?> fetchData() async {
    String api = "https://fakestoreapi.com/products";
    http.Response response = await http.get(Uri.parse(api));
    log("${response.statusCode}");

    if (response.statusCode == 200) {
      List decodedData = jsonDecode(response.body);
      List<ApiModel> data =
          decodedData.map((e) => ApiModel.fromJSON(data: e)).toList();
      return data;
    } else {
      return null;
    }
  }
}
