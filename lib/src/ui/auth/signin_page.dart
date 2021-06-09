import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  List<String> description = [
    'Agende uma demonstração!',
    'Envie uma mensagem e iremos te',
    'retornar rapidinho!'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: margemPrimaryColor),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Seja MpontoM!',
          style: TextStyle(color: margemPrimaryColor),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: constraints.maxHeight * .05,
              horizontal: constraints.maxWidth * .1,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildDescription,
                SizedBox(height: constraints.maxHeight * .03),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    prefixIcon: Icon(Icons.person_outline_rounded),
                    hintText: 'Nome',
                  ),
                ),
                SizedBox(height: constraints.maxHeight * .02),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
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
                    prefixIcon: Icon(Icons.phone_outlined),
                    hintText: 'Telefone',
                  ),
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
                  child: Text('SOLICITAR'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      ),
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
