import 'package:flutter/material.dart';
import 'package:flutter_news/infrastructure/services/theme_service.dart';
import 'package:flutter_news/presentation/pages/home_page.dart';
import 'package:flutter_news/utilities/theme_globals.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter News',
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: ThemeService().getThemeMode(),
      home: const HomePage(),
    );
  }
}
