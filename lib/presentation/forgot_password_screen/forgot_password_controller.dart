import 'package:flutter/cupertino.dart';

import '../../core/app_core_export.dart';
import '../../route/app_route_name.dart';
import '../../services/api_service/api_service_export.dart';
import '../../widget/custom__snack_bar.dart';
import '../../widget/custom_loading.dart';
import 'forgot_password_model.dart';

class ForgotPasswordController extends GetxController {
  final ApiService _apiService = ApiService();
  final forgotPasswordFormKey = GlobalKey<FormState>();
  final TextEditingController emailInputController = TextEditingController();

  void validateForm() {
    if (forgotPasswordFormKey.currentState!.validate()) {
      forgotPassword();
    }
  }

  Future<void> forgotPassword() async {
    final forgotPasswordRequest = ForgotPasswordRequestModel(
      email: emailInputController.text,
    );

    Get.showOverlay(
        asyncFunction: () async {
          await _apiService.handleApiCall(
            method: HttpMethod.post,
            url: APIPath.forgotPassword,
            body: forgotPasswordRequest.toJson(),
            requiresAuth: false,
            isResponse: true,
            onSuccessfulCallResponse: (
              response,
            ) async {
              CommonResponseModel forgotPasswordModelObj =
                  CommonResponseModel.fromJson(response);
              _showSuccessMessage(forgotPasswordModelObj.message ?? '');

              String email = emailInputController.text;
              Get.toNamed(AppRouteName.verificationCodeScreen,
                  arguments: {'email': email});
            },
          );
        },
        loadingWidget: const CustomLoading());
  }

  void _showSuccessMessage(String message) {
    CustomSnackBarController().showSuccessSnackBar(
      title: 'OTP Sent Successfully',
      message: message,
    );
  }

  @override
  void onClose() {
    super.onClose();
    emailInputController.dispose();
  }
}
