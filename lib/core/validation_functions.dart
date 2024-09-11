class ValidationFunctions {
  static isText(String? inputString, {bool isRequired = false}) {
    bool isInputStringValid = false;
    if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
      isInputStringValid = true;
    }
    if (inputString != null && inputString.isNotEmpty) {
      const pattern = r'^[a-zA-Z]+$';
      final regExp = RegExp(pattern);
      isInputStringValid = regExp.hasMatch(inputString);
    }
    return isInputStringValid;
  }

  static String? rValidateFieldInput(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName is required";
    }
    return null;
  }

  static String? validateResetPasswordInput(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName is required";
    }
    return null;
  }

  static String? validateEmailInput(String? value,
      {bool isExitEmail = false, bool isRequired = true, String? mainEmail}) {
    if (isRequired && (value == null || value.isEmpty)) {
      return "Email is required";
    } else if (value != null && value.isNotEmpty && !_isValidEmail(value)) {
      return "Please enter a valid email";
    } else if (!isRequired &&
        mainEmail != null &&
        mainEmail.isNotEmpty &&
        value == mainEmail) {
      return "This email can't be the same as the main email";
    } else if (isExitEmail) {
      return "This email address is already filled out, please enter a new one.";
    }
    return null;
  }

  static bool _isValidEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(value);
  }
}
