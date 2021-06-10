import 'package:flutter/material.dart';
import 'package:shared/shared.dart' show margemPrimaryColor;

class RecoverPasswordPage extends StatefulWidget {
  const RecoverPasswordPage({Key? key}) : super(key: key);

  @override
  _RecoverPasswordPageState createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage> {
  List<String> description = [
    'Informe o e-mail cadastrado abaixo e',
    'vamos te enviar uma nova senha',
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
          'Recuperar Senha',
          style: TextStyle(color: margemPrimaryColor),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: constraints.maxHeight * .05,
              horizontal: constraints.maxWidth * .13,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildDescription,
                SizedBox(height: constraints.maxHeight * .08),
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
                SizedBox(height: constraints.maxHeight * .04),
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
