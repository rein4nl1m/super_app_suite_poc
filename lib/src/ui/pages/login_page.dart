import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "/login";

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(),
              DefaultLogo(),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: margemPrimaryColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                child: Text('ENTRAR'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  side: BorderSide(color: margemPrimaryColor),
                ),
                onPressed: () {},
                child: Text(
                  'AINDA NÃO TENHO CONTA',
                  style: TextStyle(color: margemPrimaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Color margemPrimaryColor = Color(0xff4487c2);
