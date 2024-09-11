import 'package:flutter/material.dart';
import '../../core/app_core_export.dart';
import '../../theme/theme_helper.dart';
import 'verification_code_controller.dart';

import '../../widget/custom_elevated_button.dart';
import '../../widget/custom_pin_code_text_field.dart';

class VerificationCodeScreen extends GetWidget<VerificationCodeController> {
  const VerificationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Verification Code'),
      ),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 22.h),
        child: Column(
          children: [
            Text(
              'Enter the code we sent your registed mail',
              style: theme.textTheme.bodyLarge,
            ),
            SizedBox(
              height: 96.h,
            ),
            SizedBox(
              width: double.maxFinite,
              child: CustomPinCodeTextField(
                    context: Get.context!,
                    controller: controller.otpController,
                    onChanged: (value) {}),
            ),
            SizedBox(
              height: 14.h,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(text: "Didn\'t recevive a code?",style: TextStyle(color: Colors.black)),
                TextSpan(text: "Resent Code",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500)),
              ]),
              textAlign: TextAlign.left,
            ),
            const Spacer(
              flex: 24,
            ),
            CustomElevatedButton(
              text: "Confirm",
              onPressed: onTapConfirm,
            ),
            const Spacer(
              flex: 75,
            )
          ],
        ),
      ),
    );
  }

  void onTapConfirm() {
    controller.verifyVerification();
  }
}
