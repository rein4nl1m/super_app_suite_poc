import 'package:flutter/material.dart';
import 'package:mpontom_suite_poc/src/routes/app_routes.dart';
import 'package:shared/shared.dart';

class PreAuthPage extends StatefulWidget {
  const PreAuthPage({Key? key}) : super(key: key);

  @override
  _PreAuthPageState createState() => _PreAuthPageState();
}

class _PreAuthPageState extends State<PreAuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
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
                      padding: const EdgeInsets.symmetric(vertical: 20),
                    ),
                    child: Text('ENTRAR'),
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.LOGIN);
                    },
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .01,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).scaffoldBackgroundColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      side: BorderSide(color: margemPrimaryColor),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                    ),
                    child: Text(
                      'AINDA NÃO TENHO CONTA',
                      style: TextStyle(color: margemPrimaryColor),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.SIGNIN);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
