import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'widgets/counterwidget.dart';
import 'strings.dart';
import 'widgets/ghflutter.dart';
import 'models/favourites.dart';

final GetIt getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<Favourites>(Favourites());
  runApp(CounterApp());
}

class GHFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(primaryColor: Colors.green.shade800),
      home: GHFlutter(),
    );
  }
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(primaryColor: Colors.green.shade800),
      home: CounterWidget(),
    );
  }
}
