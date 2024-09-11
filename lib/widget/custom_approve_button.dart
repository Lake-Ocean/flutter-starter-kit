import 'package:flutter/material.dart';
import '../core/size_utils.dart';

import 'base_button.dart';

class ApproveButton extends BaseButton {
  const ApproveButton({
    super.key,
    super.text = 'Accept',
    super.onPressed,
    bool super.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 40.h,
      width: 80.h,
      child: ElevatedButton(
        onPressed: (isDisabled ?? false) ? null : (onPressed ?? () {}),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Color(0XFF0066CC),
          // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Border radius
          ),
          side: const BorderSide(color: Color(0XFF0066CC), width: 2),
          // Border color and width
          padding:
              EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Padding
        ),
        child: Text(text),
      ),
    );
  }
}
