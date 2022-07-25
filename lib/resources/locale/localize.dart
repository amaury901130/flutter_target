import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rootstrap_target/globals/globals.dart';
import 'package:rootstrap_target/resources/localization.dart';

import 'en.dart' as enLang;
import 'es.dart' as esLang;

enum Lang { es, en }

enum Localize {
  app_name,
  default_connection_error,
  message_connection_success,
  error_mandatory_field,
  error_invalid_field,
  empty,
  email_label,
  password_label,
  repeat_password_label,
  error_password_equals,
  signin_label,
  signup_label,
  forgot_pass_label,
  signin_facebook_label,
}

class Localization {
  Lang currentLang = LangExtensions.defaultLang;

  static Localization get instance => getIt<Localization>();

  static void register() => getIt.registerSingleton<Localization>(
        Localization._(),
      );

  Localization._();

  void saveLang(Lang lang) {
    currentLang = lang;
    //TODO: notify lang change
  }
}

extension LangExtensions on Lang {
  static Map<String, Lang> langValues = {
    Lang.en.toString(): Lang.en,
    Lang.es.toString(): Lang.es
  };

  static const supportedLang = [
    Locale('en', ''), // English, no country code
    Locale('es', ''), // Spanish, no country code
  ];

  static const appLocalizationDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static Map<Lang, Locale> langLocale = {
    Lang.en: const Locale('en', ''),
    Lang.es: const Locale('es', '')
  };

  static Lang defaultLang = Lang.en;
  static Locale defaultLocaleLang = const Locale('en', '');

  static Lang? fromValue(String? fromValue) => langValues[fromValue];

  static Lang fromLocale(Locale locale) {
    var lang = defaultLang;
    langLocale.forEach((key, value) {
      if (value.languageCode == locale.languageCode) {
        lang = key;
      }
    });

    return lang;
  }

  Locale get locale => langLocale[this] ?? defaultLocaleLang;

  String get value => toString();
}

const Map<Lang, Map<Localize, String>> localize = {
  Lang.en: enLang.localization,
  Lang.es: esLang.localization,
};
