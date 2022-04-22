import 'package:flutter/material.dart';
import 'package:global_configs/global_configs.dart';
import 'package:tmdb_app/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GlobalConfigs()
      .loadJsonFromdir('assets/data/api_config.json', path: 'api');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(title: 'The Movie Database'),
    );
  }
}
