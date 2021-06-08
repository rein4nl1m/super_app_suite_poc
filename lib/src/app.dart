import 'package:flutter/material.dart';
import 'package:mpontom_suite_poc/src/ui/pages/login_page.dart';
import 'package:mpontom_suite_poc/src/ui/pages/splash_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MpontoM Suite POC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        LoginPage.routeName: (context) => LoginPage(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
