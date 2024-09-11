import 'package:flutter/cupertino.dart';

import '../../core/app_core_export.dart';
import '../../route/app_route_name.dart';
import '../../services/api_service/api_service_export.dart';
import '../../widget/custom__snack_bar.dart';
import '../../widget/custom_loading.dart';
import 'reset_password_model.dart';

class ResetPasswordController extends GetxController {
  final ApiService _apiService = ApiService();
  final resetPasswordFormKey = GlobalKey<FormState>();
  final TextEditingController newPasswordInputController =
      TextEditingController();
  final TextEditingController confirmEmailInputController =
      TextEditingController();
  late String email;
  late String otp;

  Rx<bool> isShowNewPassword = true.obs;
  Rx<bool> isShowConfirmPassword = true.obs;

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['email'];
    otp = Get.arguments['otp'];
  }

  void validateForm() {
    if (resetPasswordFormKey.currentState!.validate()) {
      resetPassword();
    }
  }

  Future<void> resetPassword() async {
    final resetPasswordRequest = ResetPasswordRequestModel(
        email: email, otp: otp, newPassword: confirmEmailInputController.text);

    Get.showOverlay(
        asyncFunction: () async {
          await _apiService.handleApiCall(
            method: HttpMethod.post,
            url: APIPath.resetPassword,
            body: resetPasswordRequest.toJson(),
            requiresAuth: false,
            isResponse: true,
            onSuccessfulCallResponse: (
              response,
            ) async {
              CommonResponseModel resetPasswordModelObj =
              CommonResponseModel.fromJson(response);
              _showSuccessMessage(resetPasswordModelObj.message ?? '');
              Get.offAllNamed(AppRouteName.login);
            },
          );
        },
        loadingWidget: const CustomLoading());
  }

  void _showSuccessMessage(String message) {
    CustomSnackBarController().showSuccessSnackBar(
      title: message,
      message: '',
    );
  }

  @override
  void onClose() {
    super.onClose();
    newPasswordInputController.dispose();
    confirmEmailInputController.dispose();
  }
}
