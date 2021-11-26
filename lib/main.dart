import 'package:flutter/material.dart';
import 'package:flutter_news/app.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  //initalize Get Storage
  await GetStorage.init();
  runApp(const App());
}
