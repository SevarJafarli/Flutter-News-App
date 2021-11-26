import 'package:flutter/material.dart';
import 'package:flutter_news/infrastructure/services/theme_service.dart';
import 'package:flutter_news/presentation/pages/home_page.dart';
import 'package:flutter_news/utilities/app_constants.dart';
import 'package:flutter_news/utilities/theme_globals.dart';
import 'package:get/get.dart';
import 'presentation/widgets/custom_scroll_behavior.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: ThemeService().getThemeMode(),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: const CustomScrollBehavior(),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child!,
          ),
        );
      },
      home: const HomePage(),
    );
  }
}
