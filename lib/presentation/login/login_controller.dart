import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/pref_utils.dart';
import '../../route/app_route_name.dart';
import '../../services/api_service/api_service_export.dart';
import '../../widget/custom__snack_bar.dart';
import '../../widget/custom_loading.dart';
import 'login_model.dart';

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailInputController = TextEditingController();
  final TextEditingController passwordInputController = TextEditingController();
  final ApiService _apiService = ApiService();
  Rx<LoginModel?> loginModelObj = LoginModel().obs;

  Rx<bool> isShowPassword = true.obs;

  Future<void> validateForm() async {
    if (loginFormKey.currentState?.validate() ?? false) {
      await loginUser();
    }
  }

  Future<void> loginUser() async {
    Get.showOverlay(
        asyncFunction: () async {
          await _apiService.handleApiCall(
            method: HttpMethod.post,
            url: APIPath.login,
            body: {
              'email': emailInputController.text,
              'password': passwordInputController.text,
            },
            requiresAuth: false,
            isResponse: true,
            onSuccessfulCallResponse: (
              response,
            ) async {
              loginModelObj.value = LoginModel.fromJson(response);
              await PrefUtils().setTokenData(loginModelObj.value?.token ?? '');
              await PrefUtils()
                  .setEmailData(loginModelObj.value?.data?.email ?? '');
              _showSuccessMessage('Login successful!');
              Get.offNamed(AppRouteName.homeScreen);
            },
          );
        },
        loadingWidget: const CustomLoading());
  }

  void _showSuccessMessage(String message) {
    CustomSnackBarController().showSuccessSnackBar(
      title: 'Success',
      message: message,
    );
  }

  @override
  void onClose() {
    super.onClose();
    emailInputController.dispose();
    passwordInputController.dispose();
  }
}
