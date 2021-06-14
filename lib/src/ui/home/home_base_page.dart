import 'package:flutter/material.dart';
import 'package:mpontom_suite_poc/src/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:core/core.dart';

class HomeBasePage extends StatefulWidget {
  const HomeBasePage({Key? key}) : super(key: key);

  @override
  _HomeBasePageState createState() => _HomeBasePageState();
}

class _HomeBasePageState extends State<HomeBasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Base Page'),
            TextButton(
                onPressed: () {
                  var firebaseAuthApi =
                      Provider.of<FirebaseAuthApi>(context, listen: false);
                  firebaseAuthApi.signOut();
                  Navigator.pushReplacementNamed(context, Routes.PRE_AUTH);
                },
                child: Text('Sair'))
          ],
        ),
      ),
    );
  }
}
