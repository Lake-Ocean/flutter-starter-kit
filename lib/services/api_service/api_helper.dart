import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as get_state;
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/pref_utils.dart';
import 'api_path.dart';
import 'dio_error_handler.dart';

class ApiService {
  String mainURL = "";
  Dio dio = Dio();

  ApiService() {
    dio.options.baseUrl = APIPath.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);
  }

  Future<Response> _performDioGet(String url, Map<String, dynamic> headers,
      {Object? dataBody}) {
    return dio.get(url, options: Options(headers: headers), data: dataBody);
  }

  Future<T?> fetchObjectData<T>(
      {required String endpoint,
      Map<String, dynamic>? body,
      required T Function(Map<String, dynamic>) fromJson,
      required bool isEnquiryList,
      void Function()? onBadRequest}) async {
    try {
      final headers = {'Authorization': 'Bearer ${PrefUtils().getTokenData()}'};
      final response =
          await _performDioGet('$mainURL$endpoint', headers, dataBody: body);
      if (response.statusCode == 200 && response.data != null) {
        if (isEnquiryList) {
          return fromJson(response.data['data']);
        } else {
          print("${response.data}");
          return fromJson(response.data);
        }
      } else {
        return null;
      }
    } on DioException catch (dioException) {
      if (onBadRequest != null && dioException.response!.statusCode == 400) {
        onBadRequest();
      } else {
        DioErrorHandler().handleDioException(dioException);
      }
    }
    return null;
  }

  Future<List<T>> fetchListData<T>(
      {required String endpoint,
      required T Function(Map<String, dynamic>) fromJson,
      required bool isPagination}) async {
    try {
      final headers = {
        'Authorization': 'Bearer ${PrefUtils().getTokenData()}',
      };
      final response = await _performDioGet('$mainURL$endpoint', headers);
      if (response.statusCode == 200 &&
          response.data != null &&
          response.data['data'] != null) {
        if (isPagination) {
          final dataList = response.data['data']['items'] as List<dynamic>;
          return dataList.map((item) => fromJson(item)).toList();
        } else {
          final dataList = response.data['data'] as List<dynamic>;
          return dataList.map((item) => fromJson(item)).toList();
        }
      } else {
        handleErrorResponse(response);
      }
    } on DioException catch (dioException) {
      DioErrorHandler().handleDioException(dioException);
    }
    return <T>[];
  }

  Future<void> handleApiCall({
    required HttpMethod method,
    required String url,
    dynamic body,
    bool isBodyFormData = false,
    bool isResponse = false,
    bool requiresAuth = true,
    Function(dynamic response)? onSuccessfulCallResponse,
    Function? onSuccessfulCall,
    Function? onErrorCall,
  }) async {
    String? token;
    if (requiresAuth) {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      token = sharedPreferences.getString('token');
    }
    final fullUrl = url;
    final headers = {
      if (requiresAuth && token != null) 'Authorization': 'Bearer $token',
    };

    try {
      Response? response;

      switch (method) {
        case HttpMethod.post:
          response = await dio.post(
            fullUrl,
            data: isBodyFormData ? FormData.fromMap(body) : body,
            options: Options(
                headers: headers,
                contentType: isBodyFormData
                    ? 'multipart/form-data'
                    : 'application/json'),
          );
          break;
        case HttpMethod.put:
          response = await dio.put(
            fullUrl,
            data: isBodyFormData ? FormData.fromMap(body) : body,
            options: Options(
                headers: headers,
                contentType: isBodyFormData
                    ? 'multipart/form-data'
                    : 'application/json'),
          );
          break;
        case HttpMethod.delete:
          response = await dio.delete(fullUrl,
              data: body, options: Options(headers: headers));
          break;
        default:
          throw Exception("Unsupported HTTP method");
      }

      final statusCode = response.statusCode;

      if (statusCode == 200) {
        if (!isResponse) {
          onSuccessfulCall!();
        } else {
          onSuccessfulCallResponse?.call(response.data);
        }
      } else {
        handleErrorResponse(response);
      }
    } on DioException catch (e) {
      DioErrorHandler().handleDioException(e);
      if (onErrorCall != null) {
        onErrorCall();
      }
    }
  }

  Future<void> handleErrorResponse(
    Response response,
  ) async {
    final responseData = response.data;

    if (response.statusCode == 500 || response.statusCode == 502) {
      var errorMessage = responseData['Error'];
      debugPrint('DioError: API returned a 500 Bad Request: $errorMessage');
    } else if (response.statusCode == 503) {
      var errorMessage = responseData['Error'];
      errorMessage = 'Server issue. Please try again later';
      debugPrint('DioError: API returned a 503 Bad Request: $errorMessage');
    } else if (response.statusCode == 400) {
      var errorMessage = responseData['Error'];
      debugPrint('DioError: API returned a 400 Bad Request: $errorMessage');
    } else if (response.statusCode == 401) {
      await handleUnauthorizedResponse();
    } else if (response.statusCode == 404) {
      var errorMessage = responseData['Error'];
      debugPrint('DioError: API returned a 404 Bad Request: $errorMessage');
    } else {
      var errorMessage = responseData['Error'];
      print("handleErrorResponse $errorMessage");
      // get_state.Get.put(CustomSnackBarController())
      //     .showErrorSnackBar(title: errorMessage);
    }
  }

  Future<void> handleUnauthorizedResponse() async {
    // final sharedPreferences = await SharedPreferences.getInstance();
    // final token = sharedPreferences.getString(AuthController.userToken);
    // final refreshToken =
    // sharedPreferences.getString(AuthController.useRefreshToken);
    // final url = Uri.parse('${mainURL!}user/refresh-token');
    // final headers = {'Content-Type': 'application/json; charset=utf-8'};
    // final body = jsonEncode({
    //   'accessToken': token,
    //   'refreshToken': refreshToken,
    // });
    //
    // final response = await http.put(url, headers: headers, body: body);
    // statusCode = response.statusCode;
    // if (response.statusCode == 200) {
    //   final responseData = jsonDecode(response.body);
    //   await sharedPreferences.remove(AuthController.userToken);
    //   await sharedPreferences.remove(AuthController.useRefreshToken);
    //   await sharedPreferences.setString(
    //     AuthController.userToken,
    //     responseData['Response']['accessToken'].toString(),
    //   );
    //   await sharedPreferences.setString(
    //     AuthController.useRefreshToken,
    //     responseData['Response']['refreshToken'].toString(),
    //   );
    // } else if (response.statusCode == 500) {
    //   // MessageDialog.showApiOperationDialog(
    //   //   context,
    //   //   title: 'Session is expired or invalid',
    //   //   content: const Text(' Please login again'),
    //   //   firstButtonText: 'OK',
    //   //   dismissible: false,
    //   //   firstButtonContinueCallBack: () async {
    //   //     await AuthController().logout();
    //   //     Navigator.pop(context);
    //   //     Navigator.pushReplacementNamed(context, '/login');
    //   //   },
    //   //   secondButtonText: '',
    //   //   secondButtonContinueCallBack: () {},
    //   // );
    // } else if (response.statusCode == 400) {
    //   // MessageDialog.showApiOperationDialog(
    //   //   context,
    //   //   title: 'session is expired or invalid',
    //   //   content: Text(''),
    //   //   firstButtonText: 'OK',
    //   //   firstButtonContinueCallBack: () async {
    //   //     await AuthController().logout();
    //   //     Navigator.pop(context);
    //   //     Navigator.pushNamedAndRemoveUntil(
    //   //         context, '/login', (Route<dynamic> route) => false);
    //   //   },
    //   //   secondButtonText: '',
    //   //   secondButtonContinueCallBack: () {},
    //   // );
    // }
  }
}

enum HttpMethod { get, post, put, delete }
