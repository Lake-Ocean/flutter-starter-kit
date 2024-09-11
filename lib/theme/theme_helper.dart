import 'package:flutter/material.dart';

import '../core/app_core_export.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();

ThemeData get theme => ThemeHelper().themeData();

class ThemeHelper {
  var _appTheme = PrefUtils().getThemeData();

  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  Map<String, ColorScheme> _supportedColorColor = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  void changeTheme(String _newTheme) {
    PrefUtils().setThemeData(_newTheme);
    Get.forceAppUpdate();
  }

  LightCodeColors _getThemeColors() =>
      _supportedCustomColor[_appTheme] ?? LightCodeColors();

  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorColor[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
        visualDensity: VisualDensity.standard,
        colorScheme: colorScheme,
        textTheme: TextThemes.textTheme(colorScheme),
        scaffoldBackgroundColor: appTheme.whiteA700,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 0,
                visualDensity:
                    const VisualDensity(vertical: -4, horizontal: -4),
                padding: EdgeInsets.zero)),
        radioTheme: RadioThemeData(
            fillColor: WidgetStateColor.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return colorScheme.primary;
              }
              return Colors.transparent;
            }),
            visualDensity: const VisualDensity(vertical: -4, horizontal: -4)),
        dividerTheme:
            DividerThemeData(thickness: 4, space: 4, color: appTheme.gray200));
  }

  LightCodeColors themeColor() => _getThemeColors();

  ThemeData themeData() => _getThemeData();
}

class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
            color: colorScheme.primary,
            fontSize: 16.fSize,
            fontWeight: FontWeight.w400),
        bodyMedium: TextStyle(
            color: colorScheme.primary,
            fontSize: 14.fSize,
            fontWeight: FontWeight.w400),
        bodySmall: TextStyle(
            color: colorScheme.primary,
            fontSize: 12.fSize,
            fontWeight: FontWeight.w400),
        headlineLarge: TextStyle(
            color: colorScheme.primary,
            fontSize: 32.fSize,
            fontWeight: FontWeight.w600),
        headlineMedium: TextStyle(
            color: colorScheme.primary,
            fontSize: 28.fSize,
            fontWeight: FontWeight.w500),
        headlineSmall: TextStyle(
            color: colorScheme.primary,
            fontSize: 24.fSize,
            fontWeight: FontWeight.w500),
        labelLarge: TextStyle(
            color: colorScheme.primary,
            fontSize: 12.fSize,
            fontWeight: FontWeight.w600),
        titleLarge: TextStyle(
            color: colorScheme.primary,
            fontSize: 20.fSize,
            fontWeight: FontWeight.w600),
        titleMedium: TextStyle(
            color: colorScheme.primary,
            fontSize: 18.fSize,
            fontWeight: FontWeight.w500),
        titleSmall: TextStyle(
            color: colorScheme.primary,
            fontSize: 14.fSize,
            fontWeight: FontWeight.w500),
      );
}

class ColorSchemes {
  static const lightCodeColorScheme = ColorScheme.light(
      primary: Color(0xFF000000),
      primaryContainer: Color(0XFF1A1B20),
      secondaryContainer: Color(0XFF3771C8),
      errorContainer: Color(0XFF55ACEE),
      onError: Color(0x00000000),
      onPrimary: Color(0XFF172C70),
      onPrimaryContainer: Color(0XFFF79D15));
}

class LightCodeColors {
  Color get gray100 => const Color(0XFFF6F6F6);

  Color get gray200 => const Color(0XFFE8E8E8);

  Color get gray300 => const Color(0XFFE6E6E6);

  Color get gray30001 => const Color(0XFFE3E4E8);

  Color get gray400 => const Color(0XFFC4B5AE);

  Color get gray500 => const Color(0XFF979797);

  Color get gray900 => const Color(0XFF302521);
  Color get lime900 => const Color(0xFF946021);
  Color get orange700 => const Color(0xFFE77D00);
  Color get whiteA540 => const Color(0x8AFFFFFF);

  Color get whiteA700 => const Color(0XFFFFFFFF);
}
// // Amber
//   Colors get amber400 => Color(0XFFFFC926);
//   Colors get amber500 => Color(0XFFFFC107);
//   Colors get amber50001 => Color(0XFFF5BE18);
// // Blue
//   Colors get blue700 => C olor(0XFF1976D2);
//   Colors get blueA400 =>Color (0XFF1877F2);
// // BlueGray
//   Color get blueGray100
//   = Color(exfF090909);
//   Color
//   get blueGray50 =
//   Color(OXFFE9EDED);
// // DeepOrange
//   Color get deepOrangeA400 = Color(eXFFFF3000);
// // Gray
//   Color get
//   gray100 =>
//   Color (0XFFF6F6F6):
//   Color get
//   gray200
//   Color (0XFFE8E8E8):
//   Color get
//   gray300
//   Color (OXFFE6E6E6):
//   Color get
//   gray30001 =>
//   Color(OXFFE3E48);
//   Color get
//   gray400 =>
//   Color (OXFFC4B5AE):
//   Color get gray500 =
//   Color(0XFF979797);
//   Color get gray900 = Color (0XFF302521):
// // Green
//   Color get green500 = Color(0XFF3CE443) ;
//   Color get green50001 = Color (0XFF4CAF50) :
//   Color get green600 = Color(0XFF34A853);
// // Indigo
//   Color get indig0900 = Color(0XFF113984);
// // LightBlue
//   Color get lightBlue600 => Color (0XFF009EE3):
// // Lime
//   Color get
//   lime800 => Color (0XFFB8864B):
//   Color get
//   lime900 = Color (0XFF946021):
//   Color get
//   Lime96001 =>
//   Color (0XFF896730);
//   Color get
//   Lime90802 => Color(0XFF956F43) ;
// // Orange
//   Color get
//   orange200 =
//   Color (0XFFF6CC9B):
//   Color
//   get orange700 =
//   Color (OXFFE77D00):
//   1/ Red
//   Color
//   get
//   red100 =
//   Color(eXFFFFD5DF);
//   Color
//   get
//   red306
//   = Color(exFFBE8F5A);
//   Color
//   get
//   red606
//   = Color(eXFFE42C34);
//   Color
//   get
//   red800
//   Color(0XFFA83434);
//   Color
//   get
//   redA400 =>
//   Color (0XFFFF1818);
//   Color
//   get
//   redA700 =
//   Color (0XFFEB0519);
//   Color get
//   redA70001
//   Color(eXFFCA1305);
// // White
//   Color get whiteA700 =>
//
//   Color
//
//   (
//
//   expFaFffff
//
//   );
// // Light theme data
// }

ThemeData lightThemeData(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    hintColor: Colors.blueAccent,
    scaffoldBackgroundColor: Colors.white,
    textTheme: textTheme(context),
  );
}

// Dark theme data
ThemeData darkThemeData(BuildContext context) {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.grey[900],
    hintColor: Colors.blueAccent,
    scaffoldBackgroundColor: Colors.black,
    textTheme: textTheme(context),
  );
}

// Responsive text theme
TextTheme textTheme(BuildContext context) {
  final mediaQueryData = MediaQuery.of(context);
  double textScaleFactor = mediaQueryData.textScaleFactor;
  return ThemeData.light().textTheme.copyWith(
        displayLarge: TextStyle(fontSize: 32 * textScaleFactor),
        displayMedium: TextStyle(fontSize: 28 * textScaleFactor),
        displaySmall: TextStyle(fontSize: 24 * textScaleFactor),
        headlineMedium: TextStyle(fontSize: 20 * textScaleFactor),
        headlineSmall: TextStyle(fontSize: 16 * textScaleFactor),
        titleLarge: TextStyle(fontSize: 14 * textScaleFactor),
        bodyLarge: TextStyle(fontSize: 14 * textScaleFactor),
        bodyMedium: TextStyle(fontSize: 12 * textScaleFactor),
      );
}
