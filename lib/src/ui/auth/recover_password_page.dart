import 'package:core/api/auth/firebase_auth_api.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:provider/provider.dart';

class RecoverPasswordPage extends StatefulWidget {
  const RecoverPasswordPage({Key? key}) : super(key: key);

  @override
  _RecoverPasswordPageState createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildDescription,
                  SizedBox(height: constraints.maxHeight * .08),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(6, 4, 6, 4),
                      prefixIcon: Icon(Icons.email_outlined),
                      hintText: 'E-mail',
                    ),
                    controller: _emailController,
                    validator: InputAuthValidators.validateEmail,
                  ),
                  SizedBox(height: constraints.maxHeight * .04),
                  _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: margemPrimaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 20),
                          ),
                          child: Text('SOLICITAR'),
                          onPressed: () => recover(context),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  recover(BuildContext context) async {
    setState(() => _isLoading = !_isLoading);

    if (_formKey.currentState!.validate()) {
      var firebaseAuthApi = Provider.of<FirebaseAuthApi>(
        context,
        listen: false,
      );

      await firebaseAuthApi.recoveryPassword(email: _emailController.text);

      Navigator.pop(context);
    }

    setState(() => _isLoading = !_isLoading);
  }

  Center get buildDescription {
    return Center(
      child: Column(
        children: kRecoverPasswordDescription.map<Widget>((phrase) {
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
