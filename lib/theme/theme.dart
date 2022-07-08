import 'package:flutter/material.dart';
import 'package:rootstrap_target/theme/resources/colors.dart';

abstract class LocalTheme {
  final AppColors colors;

  LocalTheme({required this.colors});

  get buttonBorderCorner => OutlineInputBorder(
        borderSide: BorderSide(
          color: colors.dividerColor,
          width: 1.0,
        ),
      );

  ThemeData get data => ThemeData.from(
        colorScheme: colorScheme,
        textTheme: Typography.blackCupertino.copyWith(
          headline1: titleXL,
          headline2: titleL,
          headline3: titleM,
          headline4: titleS,
          headline5: titleXS,
          button: button,
          bodyText1: body,
          bodyText2: bodyS,
          subtitle1: subtitleM,
          subtitle2: subtitleS,
          caption: caption,
          overline: inputText,
        ),
      ).copyWith(
        backgroundColor: colorScheme.background,
        scaffoldBackgroundColor: colorScheme.background,
        shadowColor: colors.shadowColor,
        dividerColor: colors.dividerColor,
        buttonTheme: ButtonThemeData(
          buttonColor: colors.surface,
          hoverColor: colors.shadowColor,
          focusColor: colors.shadowColor,
          padding: EdgeInsets.zero,
          shape: buttonBorderCorner,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: buttonBorderCorner,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            enableFeedback: true,
            backgroundColor: colors.onSurface,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            alignment: Alignment.center,
            shape: buttonBorderCorner,
          ),
        ),
      );

  ColorScheme get colorScheme => ColorScheme(
        brightness: Brightness.light,
        primary: colors.primary,
        primaryContainer: colors.primary,
        secondary: colors.secondary,
        surface: colors.surface,
        background: colors.background,
        error: colors.error,
        onPrimary: colors.onPrimary,
        onSecondary: colors.onSecondary,
        onSurface: colors.onSurface,
        onBackground: colors.onBackground,
        onError: colors.onError,
      );

  final primaryFont = 'Roboto Regular';
  final primaryFontBlack = 'Roboto Black';
  final primaryFontMedium = 'Roboto Medium';
  final primaryFontLight = 'Roboto Light';
  final primaryFontHeavy = 'Roboto Heavy';

  final double titleXLFontSize = 28;
  final double titleLFontSize = 24;
  final double titleMFontSize = 20;
  final double titleSFontSize = 16;
  final double titleXSFontSize = 12;
  final double buttonFontSize = 16;
  final double bodyFontSize = 12;
  final double bodyMFontSize = 16;
  final double bodyLFontSize = 20;
  final double bodySFontSize = 8;
  final double navBarFontSize = 12;
  final double subtitleMFontSize = 12;
  final double subtitleSFontSize = 8;
  final double inputTextFontSize = 12;
  final double labelFontSize = 12;
  final double labelSFontSize = 8;
  final double captionFontSize = 12;

  get titleXLHeight => 32.4 / titleXLFontSize;

  get titleLHeight => 26.4 / titleLFontSize;

  get titleMHeight => 24 / titleMFontSize;

  get titleSHeight => 19.2 / titleSFontSize;

  get titleXSHeight => 16.8 / titleXSFontSize;

  get buttonHeight => 19.6 / buttonFontSize;

  get bodyHeight => 16.41 / bodyFontSize;

  get bodySHeight => 14 / bodyFontSize;

  get subtitleMHeight => 14.4 / subtitleMFontSize;

  get subtitleSHeight => 12 / subtitleSFontSize;

  get inputTextHeight => 13 / inputTextFontSize;

  get labelHeight => 9 / labelFontSize;

  get inputFieldLabelHeight => 7 / labelFontSize;

  get captionHeight => 14 / captionFontSize;

  get titleXL => TextStyle(
        fontFamily: primaryFontBlack,
        fontSize: titleXLFontSize,
        height: titleXLHeight,
        letterSpacing: -.07,
      );

  get titleL => TextStyle(
        fontFamily: primaryFontBlack,
        fontSize: titleLFontSize,
        height: titleLHeight,
        letterSpacing: -.22,
      );

  get titleM => TextStyle(
        fontFamily: primaryFontBlack,
        fontSize: titleMFontSize,
        height: titleMHeight,
        letterSpacing: -.2,
      );

  get titleS => TextStyle(
        fontFamily: primaryFontBlack,
        fontSize: titleSFontSize,
        height: titleSHeight,
        letterSpacing: -.16,
      );

  get titleXS => TextStyle(
        fontFamily: primaryFontHeavy,
        fontSize: titleXSFontSize,
        height: titleXSHeight,
        letterSpacing: -.14,
      );

  get subtitleM => TextStyle(
        fontFamily: primaryFontBlack,
        fontSize: subtitleMFontSize,
        height: subtitleMHeight,
        letterSpacing: -.12,
      );

  get subtitleS => TextStyle(
        fontFamily: primaryFontBlack,
        fontSize: subtitleSFontSize,
        height: subtitleSHeight,
        letterSpacing: .6,
      );

  get button => TextStyle(
        fontFamily: primaryFontBlack,
        fontSize: buttonFontSize,
        height: buttonHeight,
        letterSpacing: 1.4,
      );

  get body => TextStyle(
        fontFamily: primaryFontLight,
        fontSize: bodyFontSize,
        height: bodyHeight,
        fontWeight: FontWeight.normal,
        letterSpacing: -.14,
      );

  get bodyS => TextStyle(
        fontFamily: primaryFontMedium,
        fontSize: bodySFontSize,
        height: bodySHeight,
        fontWeight: FontWeight.normal,
        letterSpacing: -.14,
      );

  get inputText => TextStyle(
        fontFamily: primaryFontMedium,
        fontSize: titleXSFontSize,
        height: inputTextHeight,
        letterSpacing: .1,
      );

  get caption => TextStyle(
        fontFamily: primaryFontHeavy,
        fontSize: captionFontSize,
        height: captionHeight,
      );

  get label => TextStyle(
        fontFamily: primaryFontBlack,
        fontSize: labelFontSize,
        height: labelHeight,
        letterSpacing: 1,
      );

  get labelS => TextStyle(
        fontFamily: primaryFontBlack,
        fontSize: labelSFontSize,
        height: labelHeight,
        letterSpacing: 1,
      );
}
