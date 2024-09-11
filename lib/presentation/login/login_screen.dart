import 'package:flutter/material.dart';


import '../../route/app_route_name.dart';
import '../../theme/theme_helper.dart';
import '../../core/app_core_export.dart';
import '../../widget/custom_elevated_button.dart';
import '../../widget/custom_text_form_field.dart';
import 'login_controller.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 22.h),
          child: Form(
            key: controller.loginFormKey,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Welcome\n Back !',
                    style:
                        theme.textTheme.headlineMedium!.copyWith(height: 1.50),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                _buildEmailInput(),
                SizedBox(
                  height: 20.h,
                ),
                _buildPasswordInput(),
                SizedBox(
                  height: 12.h,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: onTapForgotPasswordText,
                    child: Text(
                      'Forgot Password',
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomElevatedButton(
                  text: "Login",
                  onPressed: onTapLoginButton,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordInput() {
    return Obx(
      () => CustomTextFormField(
          controller: controller.passwordInputController,
          hitText: 'Password',
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          suffixWidget: InkWell(
            onTap: () {
              controller.isShowPassword.value =
                  !controller.isShowPassword.value;
            },
            child: controller.isShowPassword.value
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
          ),
          suffixConstraints: BoxConstraints(maxHeight: 52.h),
          obscureText: controller.isShowPassword.value,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.h),
          validator: (value) =>
              ValidationFunctions.rValidateFieldInput(value, "Password")),
    );
  }

  Widget _buildEmailInput() {
    return CustomTextFormField(
        controller: controller.emailInputController,
        hitText: 'Email',
        contentPadding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.h),
        validator: (value) => ValidationFunctions.validateEmailInput(value));
  }

  void onTapForgotPasswordText() {
    Get.toNamed(
      AppRouteName.forgotPasswordScreen,
      arguments: {
        'email': controller.emailInputController.text,
        // Pass the email as an argument
      },
    );
  }

  void onTapLoginButton() {
    controller.validateForm();
  }
}
