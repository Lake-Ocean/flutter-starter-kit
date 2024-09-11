class VerificationCodeRequestModel {
  final String email;
  final String otp;

  VerificationCodeRequestModel({required this.email, required this.otp});

  Map<String, dynamic> toJson() {
    return {'email': email, 'otp': otp};
  }
}