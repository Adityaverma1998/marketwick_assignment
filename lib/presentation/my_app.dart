import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marketwick_assignment/constant/app_theme.dart';
import 'package:marketwick_assignment/constant/strings.dart';
import 'package:marketwick_assignment/data/widget/primary_layout/primary_layout.dart';

class MyApp  extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Strings.appName,
          theme:  AppThemeData.lightThemeData,
          // ? AppThemeData.darkThemeData
          // : AppThemeData.lightThemeData,
          // routes: Routes.routes,
          // locale: Locale(_languageStore.locale),
          // supportedLocales: _languageStore.supportedLanguages
          //     .map((language) => Locale(language.locale, language.code))
          //     .toList(),
          // localizationsDelegates: [
          //   // A class which loads the translations from JSON files
          //   AppLocalizations.delegate,
          //   // Built-in localization of basic text for Material widgets
          //   GlobalMaterialLocalizations.delegate,
          //   // Built-in localization for text direction LTR/RTL
          //   GlobalWidgetsLocalizations.delegate,
          //   // Built-in localization of basic text for Cupertino widgets
          //   GlobalCupertinoLocalizations.delegate,
          // ],
          home: const PrimaryLayout(),
        );
      },
    );
  }

}
