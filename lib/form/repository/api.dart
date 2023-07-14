import 'dart:convert';
import 'package:dio/dio.dart';

// const String serverUrl = "http://10.0.2.2:8000/";
// const String serverUrl =
//     "https://459c-2800-cd0-ad3e-4d00-85a2-b979-1b32-19a8.sa.ngrok.io/";
const String serverUrl = "https://30de-2800-cd0-ad37-e500-3493-fe58-88d2-b62e.ngrok-free.app";

// const String apiPath = "api/v1/";
const String apiPath = "api/v2/forms/";
String finalUrl = serverUrl + apiPath;
String currentToken = "";

var dio = Dio();

Map<String, String> _getHeaderInvoice(String license) {
  return {"license-key": license, "Content-Type": "application/json"};
}

Map<String, String> _getHeader() {
  if (currentToken == "") {
    return {"Content-Type": "application/json"};
  }
  return {
    "Authorization": "Bearer $currentToken",
    "Content-Type": "application/json"
  };
}

class BackendResponse {
  int status = 0;
  Map myBody = {};
  BackendResponse({this.status = 999, this.myBody = const {}});
  @override
  String toString() {
    return "[RES $status] $myBody";
  }
}

class Api {
  static Future<BackendResponse> _get(String path) async {
    finalUrl = serverUrl + apiPath + path;
    print(finalUrl);

    Response response = await dio.get(
        finalUrl); // options: Options(headers: {"Authorization": "Bearer $currentToken"})
    Map<String, dynamic> result = response.data == "" ? {} : response.data;
    return BackendResponse(myBody: result, status: response.statusCode ?? 666);
  }

  static Future<BackendResponse> _delete(String path) async {
    finalUrl = serverUrl + apiPath + path;

    Response response = await dio.delete(
        finalUrl); // options: Options(headers: {"Authorization": "Bearer $currentToken"})
    return BackendResponse(myBody: {}, status: response.statusCode ?? 666);
  }

  static Future<BackendResponse> _postOrPut(String path, Map myBody,
      {bool isPut = false}) async {
    finalUrl = serverUrl + apiPath + path;
    print("Post or put " + finalUrl);
    print(myBody);
    print("finalUrl: $finalUrl");
    String myBodyString = json.encode(myBody);
    Response response;
    print("myBodyString: $myBodyString");
    if (isPut) {
      response = await dio.put(finalUrl,
          options: Options(headers: _getHeader()), data: myBodyString);
    } else {
      response = await dio.post(finalUrl,
          options: Options(headers: _getHeader()), data: myBodyString);
    }
    print("Response: ${response.data.toString()}");
    Map<String, dynamic> objectResponse = response.data;
    if (objectResponse["error"] == true) {
      return BackendResponse(myBody: {}, status: response.statusCode ?? 0);
    }
    return BackendResponse(
        myBody: objectResponse, status: response.statusCode ?? 0);
  }

  static Future<BackendResponse> _post(String path, Map myBody) async {
    return await _postOrPut(path, myBody, isPut: false);
  }

  static Future<BackendResponse> _put(String path, Map myBody) async {
    return await _postOrPut(path, myBody, isPut: true);
  }
}
