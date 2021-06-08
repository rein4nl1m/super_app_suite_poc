import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mpontom_suite_poc/src/ui/pages/login_page.dart';
import 'package:shared/shared.dart';
import 'package:package_info/package_info.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/splash";

  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<String> _version() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    return info.version;
  }

  _startSplash() {
    Duration durationSplash = Duration(seconds: 3);
    return Timer(durationSplash, _loginNavigation);
  }

  void _loginNavigation() {
    Navigator.of(context).pushNamedAndRemoveUntil(
      LoginPage.routeName,
      (route) => false,
    );
  }

  @override
  void initState() {
    super.initState();
    _startSplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: DefaultLogo(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FutureBuilder<String>(
              future: _version(),
              builder: (context, snapshot) {
                var versionInfo = "";
                if (snapshot.hasData) versionInfo = "v ${snapshot.data}";

                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    versionInfo,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
