import 'package:flutter/material.dart';
import '../core/size_utils.dart';

import 'theme_helper.dart';

extension on TextStyle {
  TextStyle get poppins {
    return copyWith(fontFamily: 'Poppins');
  }
}

class CustomTextStyle {
  static get bodyLarge18 =>
      theme.textTheme.bodyLarge!.copyWith(fontSize: 18.fSize);

  static get bodyLargeGray500 =>
      theme.textTheme.bodyLarge!.copyWith(color: appTheme.gray500);

  static get bodyLargeGray50018 => theme.textTheme.bodyLarge!
      .copyWith(color: appTheme.gray500, fontSize: 18.fSize);

  static get bodyMedium13 =>
      theme.textTheme.bodyMedium!.copyWith(fontSize: 13.fSize);

  static get bodyMediumGray500 =>
      theme.textTheme.bodyMedium!.copyWith(color: appTheme.gray500);

  static get bodyMediumGray50015 => theme.textTheme.bodyMedium!
      .copyWith(color: appTheme.gray500, fontSize: 15.fSize);

  static get bodyMediumGray500_1 =>
      theme.textTheme.bodyMedium!.copyWith(color: appTheme.gray500);

  static get bodyMediumLime900 =>
      theme.textTheme.bodyMedium!.copyWith(color: appTheme.lime900);

  static get bodyMediumWhiteA700 =>
      theme.textTheme.bodyMedium!.copyWith(color: appTheme.whiteA700);

  static get bodySmallPrimary =>
      theme.textTheme.bodySmall!.copyWith(color: theme.colorScheme.primary);

  static get bodySmallWhiteA700 =>
      theme.textTheme.bodySmall!.copyWith(color: appTheme.whiteA700);

  static get headlineMediumBold =>
      theme.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w700);

  static get headlineSmallPrimary => theme.textTheme.headlineSmall!
      .copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.w600);

  static get headlineSmallPrimaryBold => theme.textTheme.headlineSmall!
      .copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.w700);

  static get headlineSmallPrimary_1 => theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.primary,
      );

  static get labelLargeLime900 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.lime900,
      );

  static get titleLargeBold =>
      theme.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700);

  static get titleLargeBold_1 =>
      theme.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700);

  static get titleLargeLime900 => theme.textTheme.titleLarge!
      .copyWith(color: appTheme.lime900, fontWeight: FontWeight.w700);

  static get titleLargeSemiBold =>
      theme.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600);

  static get titleMedium16 =>
      theme.textTheme.titleMedium!.copyWith(fontSize: 16.fSize);

  static get titleMediumGray500 => theme.textTheme.titleMedium!.copyWith(
      fontSize: 16.fSize, color: appTheme.gray500, fontWeight: FontWeight.w600);

  static get titleMediumLime900 => theme.textTheme.titleMedium!.copyWith(
      fontSize: 16.fSize, color: appTheme.lime900, fontWeight: FontWeight.w600);

  static get titleMediumLime900SemiBold => theme.textTheme.titleMedium!
      .copyWith(color: appTheme.lime900, fontWeight: FontWeight.w600);

  static get titleMediumSemiBold => theme.textTheme.titleMedium!
      .copyWith(fontSize: 16.fSize, fontWeight: FontWeight.w600);

  static get titleMediumSemiBold16 => theme.textTheme.titleMedium!
      .copyWith(fontSize: 16.fSize, fontWeight: FontWeight.w600);

  static get titleMediumSemiBold_1 =>
      theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600);

  static get titleMediumSemiBold_2 =>
      theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600);

  static get titleMediumWhiteA700 =>
      theme.textTheme.titleMedium!.copyWith(color: appTheme.whiteA700);

  static get titleMediumWhiteA70016 => theme.textTheme.titleMedium!
      .copyWith(color: appTheme.whiteA700, fontSize: 16.fSize);


  static get titleSmallBold => theme.textTheme.titleSmall!
      .copyWith(fontWeight: FontWeight.w700);

  static get titleSmallBold_1 => theme.textTheme.titleSmall!
      .copyWith(fontWeight: FontWeight.w700);

  static get titleSmallLime900 => theme.textTheme.titleSmall!
      .copyWith(color: appTheme.lime900);
  static get titleSmallOrange700 => theme.textTheme.titleSmall!
      .copyWith(color: appTheme.orange700);
}
