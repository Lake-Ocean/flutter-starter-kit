import 'package:flutter/cupertino.dart';

import '../../core/app_core_export.dart';
import '../../route/app_route_name.dart';
import '../../services/api_service/api_service_export.dart';
import '../../widget/custom__snack_bar.dart';
import '../../widget/custom_loading.dart';
import 'verification_code_model.dart';

class VerificationCodeController extends GetxController {
  final ApiService _apiService = ApiService();
  final verificationCodeFormKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  late String email;

  @override
  void onInit() {
    super.onInit();
    // listenForCode();
    email = Get.arguments['email'];
  }

  Future<void> verifyVerification() async {
    final forgotPasswordRequest =
        VerificationCodeRequestModel(email: email, otp: otpController.text);

    Get.showOverlay(
        asyncFunction: () async {
          await _apiService.handleApiCall(
            method: HttpMethod.post,
            url: APIPath.verifyOtp,
            body: forgotPasswordRequest.toJson(),
            requiresAuth: false,
            isResponse: true,
            onSuccessfulCallResponse: (
              response,
            ) async {
              CommonResponseModel verificationCodeModelObj =
                  CommonResponseModel.fromJson(response);
              _showSuccessMessage(verificationCodeModelObj.message ?? '');

              Get.toNamed(AppRouteName.resetPasswordScreen,
                  arguments: {'email': email, 'otp': otpController.text});
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

// @override
// void codeUpdated() {
//   otpController.value.text = code ?? '';
// }
}
