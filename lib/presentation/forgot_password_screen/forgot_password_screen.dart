import 'package:flutter/material.dart';

import '../../theme/theme_helper.dart';
import '../../widget/custom_elevated_button.dart';
import '../../widget/custom_text_form_field.dart';
import '../../core/app_core_export.dart';
import 'forgot_password_controller.dart';

class ForgotPasswordScreen extends GetWidget<ForgotPasswordController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 22.h),
        child: Form(
          key: controller.forgotPasswordFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 278.h,
                child: Text(
                  "We need you registration email to sen you password reset code!",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyLarge!.copyWith(height: 1.50),
                ),
              ),
              SizedBox(
                height: 78.h,
              ),
              CustomTextFormField(
                  controller: controller.emailInputController,
                  hitText: 'Email',
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.emailAddress,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.h),
                  validator: (value) =>
                      ValidationFunctions.validateEmailInput(value)),
              SizedBox(
                height: 20.h,
              ),
              CustomElevatedButton(
                text: 'Send Code',
                onPressed: onTapSendCode,
              ),
              SizedBox(
                height: 4.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  void onTapSendCode() {
    controller.validateForm();
  }
}
