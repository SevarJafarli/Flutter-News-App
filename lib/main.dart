import 'package:flutter/material.dart';
import 'package:flutter_news/app.dart';
import 'package:flutter_news/infrastructure/main_configs.dart';
import 'package:provider/provider.dart';

import 'infrastructure/providers/connectivity_provider.dart';

Future<void> main() async {
  //initalize Main Configurations
  await MainConfigs.configure();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ConnectivityProvider>(
      create: (_) => ConnectivityProvider(),
    ),
  ], child: const App()));
}
