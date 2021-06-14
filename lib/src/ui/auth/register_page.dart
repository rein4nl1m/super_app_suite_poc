import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isRegistering = false;

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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildDescription,
                  SizedBox(height: constraints.maxHeight * .03),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(6, 4, 6, 4),
                      prefixIcon: Icon(Icons.person_outline_rounded),
                      hintText: 'Nome',
                    ),
                    controller: _nameController,
                    validator: InputAuthValidators.validateName,
                  ),
                  SizedBox(height: constraints.maxHeight * .02),
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
                  SizedBox(height: constraints.maxHeight * .02),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(6, 4, 6, 4),
                      prefixIcon: Icon(Icons.lock_outlined),
                      hintText: 'Senha',
                    ),
                    obscureText: true,
                    controller: _passwordController,
                    validator: InputAuthValidators.validatePassword,
                  ),
                  SizedBox(height: constraints.maxHeight * .02),
                  _isRegistering
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
                          onPressed: () => register(context),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  register(BuildContext context) async {
    setState(() => _isRegistering = !_isRegistering);

    if (_formKey.currentState!.validate()) {
      var firebaseAuthApi = Provider.of<FirebaseAuthApi>(
        context,
        listen: false,
      );
      await firebaseAuthApi.register(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      );

      Navigator.pop(context);
    }

    setState(() => _isRegistering = !_isRegistering);
  }

  Center get buildDescription {
    return Center(
      child: Column(
        children: kSigninDescription.map<Widget>((phrase) {
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
