import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as get_state;

import '../../widget/custom__snack_bar.dart';
import 'api_helper.dart';

class DioErrorHandler {
  final CustomSnackBarController _snackBarController =
      get_state.Get.put(CustomSnackBarController());

  Future<void> handleDioException(DioException e) async {
    try {
      final response = e.response;
      if (response != null) {
        final statusCode = response.statusCode;
        switch (statusCode) {
          case 400:
            _handleBadRequest(response);
            break;
          case 401:
            await _handleUnauthorized();
            break;
          case 404:
            _handleNotFound(response);
            break;
          case 500:
            _handleServerIssuesCode(response);
            break;
          case 502:
            _handleServerIssues(response);
            break;
          case 503:
            _handleServerIssues(response);
          default:
            _handleDefault(response);
            break;
        }
      } else {
        _handleDefault(response!);
      }
    } catch (error) {
      _handleDefault(e.response);
    }
  }

  void _handleBadRequest(
    Response response,
  ) {
    final responseData = response.data;
    final errorMessage =
        responseData?['error'] ?? 'Unknown error ${response.statusCode}';
    _snackBarController.showErrorSnackBar(title: errorMessage, message: '');
    debugPrint('DioError: API returned a 400 Bad Request: $errorMessage');
  }

  Future<void> _handleUnauthorized() async {
    await ApiService().handleUnauthorizedResponse();
    // .then((value) {
    // MessageDialog().snackBarCut(context, 'Something want to wrong',
    //     'We kindly request you to refresh or reopen this page');
    // });
  }

  void _handleNotFound(Response response) {
    final responseData = response.data;
    final errorMessage =
        responseData?['error'] ?? 'Unknown error ${response.statusCode ?? '-'}';
    _snackBarController.showErrorSnackBar(
        title: '$errorMessage',
        message: '');
        // message: 'We can\'t seem to find the page you\'re looking for');
  }

  void _handleServerIssuesCode(Response response) {
    final responseData = response.data;
    final errorMessage =
        responseData?['error'] ?? 'Unknown error ${response.statusCode ?? '-'}';
    _snackBarController.showErrorSnackBar(title: errorMessage, message: '');
  }

  void _handleServerIssues(Response response) {
    _snackBarController.showErrorSnackBar(
        title: 'Something want to wrong',
        message: 'Server issue. Please try again later');
  }

  void _handleDefault(Response? response) {
    final responseData = response?.data;
    print("responseData $responseData");
    final errorMessage = (responseData != null &&
            responseData != "" &&
            responseData['error'])
        ? responseData['error'] ?? '--'
        : 'Unknown error ${response?.statusCode ?? '--'} ${response ?? '--'}';
    _snackBarController.showErrorSnackBar(
      title: errorMessage.toString(),
    );
  }
}
