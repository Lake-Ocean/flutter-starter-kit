class CommonResponseModel {
  String? message;
  bool? success;

  CommonResponseModel({this.message, this.success});

  CommonResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
  }
}