import 'package:flutter/material.dart';

import '../../core/app_core_export.dart';
import '../../theme/theme_helper.dart';
import '../../widget/custom_elevated_button.dart';
import '../../widget/custom_text_form_field.dart';
import 'reset_password_controller.dart';

class ResetPasswordScreen extends GetWidget<ResetPasswordController> {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Reset Password'),
      ),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 22.h),
        child: Form(
          key: controller.resetPasswordFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter a new password",
                style: theme.textTheme.bodyLarge,
              ),
              SizedBox(
                height: 46.h,
              ),
              Obx(
                () => CustomTextFormField(
                    controller: controller.newPasswordInputController,
                    hitText: 'New Password',
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.visiblePassword,
                    suffixWidget: InkWell(
                      onTap: () {
                        controller.isShowNewPassword.value =
                            !controller.isShowNewPassword.value;
                      },
                      child: controller.isShowNewPassword.value
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                    suffixConstraints: BoxConstraints(maxHeight: 52.h),
                    obscureText: controller.isShowNewPassword.value,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.h),
                    validator: (value) =>
                        ValidationFunctions.rValidateFieldInput(
                            value, "New password")),
              ),
              SizedBox(
                height: 20.h,
              ),
              Obx(
                () => CustomTextFormField(
                    controller: controller.confirmEmailInputController,
                    hitText: 'Confirm Password',
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    suffixWidget: InkWell(
                      onTap: () {
                        controller.isShowConfirmPassword.value =
                            !controller.isShowConfirmPassword.value;
                      },
                      child: controller.isShowConfirmPassword.value
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                    suffixConstraints: BoxConstraints(maxHeight: 52.h),
                    obscureText: controller.isShowConfirmPassword.value,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.h),
                    validator: (value) =>
                        ValidationFunctions.rValidateFieldInput(
                            value, "Confirm password")),
              ),
              const Spacer(
                flex: 27,
              ),
              CustomElevatedButton(
                text: 'Confirm',
                onPressed: onTapConfirm,
              ),
              const Spacer(
                flex: 72,
              )
            ],
          ),
        ),
      ),
    );
  }

  void onTapConfirm() {
    controller.validateForm();
  }
}
