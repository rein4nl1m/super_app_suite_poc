import 'package:flutter/material.dart' show runApp, WidgetsFlutterBinding;
import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;
import 'package:mpontom_suite_poc/src/app.dart';
import 'package:core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Core.initApp();
  runApp(App());
}
