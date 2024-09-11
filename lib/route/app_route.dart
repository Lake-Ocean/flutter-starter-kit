import 'package:get/get.dart';

import '../presentation/forgot_password_screen/forgot_password_binding.dart';
import '../presentation/forgot_password_screen/forgot_password_screen.dart';
import '../presentation/home_screen/home_screen.dart';
import '../presentation/home_screen/home_screen_binding.dart';
import '../presentation/login/login_binding.dart';
import '../presentation/login/login_screen.dart';
import '../presentation/reset_password_screen/reset_password_binding.dart';
import '../presentation/reset_password_screen/reset_password_screen.dart';
import '../presentation/splash_screen/splash_screen.dart';
import '../presentation/splash_screen/splash_screen_binding.dart';
import '../presentation/verification_code_screen/verification_code_binding.dart';
import '../presentation/verification_code_screen/verification_code_screen.dart';
import 'app_route_name.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
        name: AppRouteName.splashScreen,
        page: () => const SplashScreen(),
        bindings: [SplashBinding()]),
    GetPage(
        name: AppRouteName.initialRoute,
        page: () => const LoginScreen(),
        bindings: [LoginBinding()]),
    //       page: () => const HomeScreen(),
    //       bindings: [HomeBinding()]),
    GetPage(
        name: AppRouteName.login,
        page: () => const LoginScreen(),
        bindings: [LoginBinding()]),
    GetPage(
        name: AppRouteName.forgotPasswordScreen,
        page: () => const ForgotPasswordScreen(),
        bindings: [ForgotPasswordBinding()]),
    GetPage(
        name: AppRouteName.verificationCodeScreen,
        page: () => const VerificationCodeScreen(),
        bindings: [VerificationCodeBinding()]),
    GetPage(
        name: AppRouteName.resetPasswordScreen,
        page: () => const ResetPasswordScreen(),
        bindings: [ResetPasswordBinding()]),
    GetPage(
        name: AppRouteName.homeScreen,
        page: () => HomeScreen(),
        bindings: [HomeScreenBinding()]),
  ];
}
