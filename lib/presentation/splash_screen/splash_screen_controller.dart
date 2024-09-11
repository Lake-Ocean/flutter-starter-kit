import '../../core/app_core_export.dart';
import '../../route/app_route_name.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        final String? token = PrefUtils().getTokenData();

        if (token != null && token.isNotEmpty) {
          Get.offAllNamed(AppRouteName.homeScreen);
        } else {
          Get.offAllNamed(AppRouteName.login);
        }
      },
    );
  }
}
