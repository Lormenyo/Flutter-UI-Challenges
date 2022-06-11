import 'package:ecg/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

TextTheme ecgLightTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline1: base.headline1!.copyWith(
          fontSize: 32.0,
          height: 1.25,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w300,
        ),
        headline2: base.headline2!.copyWith(
          fontSize: 20.0,
          height: 1.2,
          fontFamily: 'Satoshi',
        ),
        headline3: base.headline3!.copyWith(
          fontSize: 16.0,
          height: 1.125,
          fontFamily: 'Satoshi',
        ),
        headline4: base.headline4!.copyWith(
          fontSize: 14.0,
          height: 1.14,
          fontFamily: 'Satoshi',
        ),
        subtitle1: base.headline3!.copyWith(
          fontSize: 14.0,
          height: 1.2,
          fontFamily: 'Satoshi',
        ),
        bodyText1: base.bodyText1!.copyWith(
          fontSize: 14.0,
          height: 1.2,
          fontFamily: 'Satoshi',
        ),
        bodyText2: base.bodyText2!.copyWith(
          fontSize: 12.0,
          height: 1.17,
          fontFamily: 'Satoshi',
        ),
        button: base.button!.copyWith(
          fontSize: 14.0,
          height: 1.2,
          fontFamily: 'Satoshi',
        ),
        caption: base.caption!.copyWith(
          fontSize: 10.0,
          height: 1.2,
          fontFamily: 'Satoshi',
        ),
        overline: base.overline!
            .copyWith(fontWeight: FontWeight.normal, fontFamily: 'Satoshi'),
      )
      .apply(
        displayColor: AppColors.ecgBlack,
        bodyColor: AppColors.ecgBlack,
      );
}

extension CustomEcgText on TextTheme {
  TextStyle get ecgTitle900 {
    return const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontFamily: 'Satoshi',
    );
  }

  TextStyle get ecgTitle700 {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      fontFamily: 'Satoshi',
    );
  }

  TextStyle get ecgTitle500 {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: 'Satoshi',
    );
  }

  TextStyle get ecgBody100 {
    return const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      fontFamily: 'Satoshi',
    );
  }

  TextStyle get ecgBody700 {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      fontFamily: 'Satoshi',
    );
  }
}
