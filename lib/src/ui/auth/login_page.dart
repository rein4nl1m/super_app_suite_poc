import 'package:flutter/material.dart';
import 'package:mpontom_suite_poc/src/routes/app_routes.dart';
import 'package:shared/shared.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<String> description = [
    'Agende uma demonstração!',
    'Envie uma mensagem e iremos te',
    'retornar rapidinho!'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: constraints.maxHeight * .05,
            horizontal: constraints.maxWidth * .1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: constraints.maxHeight * .08,
                ),
                child: DefaultLogo(),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(6, 4, 6, 4),
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: 'E-mail',
                ),
              ),
              SizedBox(height: constraints.maxHeight * .02),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(6, 4, 6, 4),
                  prefixIcon: Icon(Icons.lock_outlined),
                  hintText: 'Senha',
                  suffixIcon: Icon(
                    Icons.visibility,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    enableFeedback: false,
                    child: Text('Esqueceu a senha?'),
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.RECOVER_PASSWORD);
                    },
                  ),
                ],
              ),
              SizedBox(height: constraints.maxHeight * .02),
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
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      }),
    );
  }

  Center get buildDescription {
    return Center(
      child: Column(
        children: description.map<Widget>((phrase) {
          return Text(
            phrase,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          );
        }).toList(),
      ),
    );
  }
}
