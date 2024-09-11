import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../core/size_utils.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../theme/theme_helper.dart';

class CustomPinCodeTextField extends StatelessWidget {
  const CustomPinCodeTextField(
      {super.key,
      required this.context,
      required this.onChanged,
      this.alignment,
      this.textStyle,
      this.hitStyle,
      this.validator,
      this.controller});

  final BuildContext context;
  final Alignment? alignment;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final TextStyle? hitStyle;
  final Function(String value) onChanged;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: pinCodeTextFieldWidget,
          )
        : pinCodeTextFieldWidget;
  }

  Widget get pinCodeTextFieldWidget => PinCodeTextField(
        appContext: context,
        controller: controller,
        length: 6,
        keyboardType: TextInputType.number,
        textStyle: textStyle,
        hintStyle: hitStyle,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        enableActiveFill: true,
        pinTheme: PinTheme(
          fieldHeight: 52.h,
          fieldWidth: 52.h,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10.h),
          inactiveFillColor: appTheme.gray200,
          inactiveColor: appTheme.gray200,
          activeColor: appTheme.gray200,
          activeFillColor: appTheme.gray200,
          selectedColor: appTheme.gray200,
          selectedFillColor: appTheme.gray200,
        ),
        onChanged: onChanged,
        validator: validator,
      );
}
