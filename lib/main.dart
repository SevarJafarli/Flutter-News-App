import 'package:flutter/material.dart';
import 'package:flutter_news/app.dart';
import 'package:flutter_news/infrastructure/main_configs.dart';

Future<void> main() async {
  //initalize Main Configurations
  await MainConfigs.configure();

  runApp(const App());
}
