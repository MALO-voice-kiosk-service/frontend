import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> httpGet({required String path}) async {
  String baseUrl = 'http://223.130.157.192:8080$path';

  try {
    http.Response response = await http.get(Uri.parse(baseUrl), headers: {
      "accept": "application/json",
      "Content-Type": "application/json",
    });

    try {
      Map<String, dynamic> resBody =
      jsonDecode(utf8.decode(response.bodyBytes));
      return resBody;
    } catch (e) {
      // response body가 json이 아닌 경우
      return {'statusCode': 490};
    }
  } catch (e) {
    // 서버가 응답하지 않는 경우
    return {'statusCode': 503};
  }
}

Future<Map<String, dynamic>> httpPostForMap({required String path, Map? data}) async {
  String baseUrl = 'http://223.130.157.192:8080$path';
  var body = jsonEncode(data);

  try {
    http.Response response =
    await http.post(Uri.parse(baseUrl), body: body, headers: {
      "accept": "application/json",
      "Content-Type": "application/json",
    });
    try {
      Map<String, dynamic> resBody = jsonDecode(utf8.decode(response.bodyBytes));
      return resBody;
    } catch (e) {
      // response body가 json이 아닌 경우
      return {'statusCode': 490};
    }

  } catch (e) {
    // 서버가 응답하지 않는 경우
    return {'statusCode': 503};
  }
}

Future<int> httpPost({required String path, Map? data}) async {
// return type: int => post 잘 됐는지 여부만 확인
  String baseUrl = 'http://223.130.157.192:8080$path';
  var body = jsonEncode(data);

  try {
    http.Response response =
    await http.post(Uri.parse(baseUrl), body: body, headers: {
      "accept": "application/json",
      "Content-Type": "application/json",
    });
    return response.statusCode;

  } catch (e) {
    return 503;
  }
}

Future<int> httpPostString({required String path, required String data}) async {
// return type: int => post 잘 됐는지 여부만 확인
  String baseUrl = 'http://223.130.157.192:8080$path';
  var body = jsonEncode(data);

  try {
    http.Response response =
    await http.post(Uri.parse(baseUrl), body: body, headers: {
      "accept": "application/json",
      "Content-Type": "application/json",
    });
    return response.statusCode;

  } catch (e) {
    return 503;
  }
}