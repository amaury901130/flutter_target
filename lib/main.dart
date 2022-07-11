import 'package:flutter/material.dart';
import 'package:rootstrap_target/component_init.dart';
import 'package:rootstrap_target/globals/preferences.dart';
import 'package:rootstrap_target/resources/locale/localize.dart';
import 'package:rootstrap_target/theme/variants/light.dart';
import 'package:rootstrap_target/ui/app_status_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Component.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Locale get appLang =>
      LangExtensions.langLocale[Preferences.instance.appLang] ??
      LangExtensions.defaultLocaleLang;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: LightTheme().data,
      locale: appLang,
      supportedLocales: LangExtensions.supportedLang,
      localizationsDelegates: LangExtensions.appLocalizationDelegates,
      home: const _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  const _MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AppStatusWidget(),
    );
  }
}
