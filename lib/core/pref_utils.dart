import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  PrefUtils() {
    SharedPreferences.getInstance().then(
      (value) => _sharedPreferences = value,
    );
  }

  static SharedPreferences? _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print("SharePreferences Initialized");
  }

  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  Future<void> setThemeData(String value) {
    return _sharedPreferences!.setString('themeData', value);
  }

  Future<void> setTokenData(String value) {
    return _sharedPreferences!.setString('token', value);
  }

  String? getTokenData() {
    try {
      return _sharedPreferences?.getString('token')!;
    } catch (error) {
      return null;
    }
  }
  Future<void> setEmailData(String value) {
    return _sharedPreferences!.setString('email', value);
  }

  String? getEmailData() {
    try {
      return _sharedPreferences?.getString('email')!;
    } catch (error) {
      return null;
    }
  }

  Future<void> setSolicitorId(String value) {
    return _sharedPreferences!.setString('solicitorId', value);
  }

  String? getSolicitorIdData() {
    try {
      return _sharedPreferences?.getString('solicitorId')!;
    } catch (error) {
      return null;
    }
  }
  String getThemeData() {
    try {
      return _sharedPreferences?.getString('themeData') ?? '';
    } catch (error) {
      return 'primary';
    }
  }
}
