import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:mpontom_suite_poc/src/routes/app_routes.dart';
import 'package:shared/shared.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isObscure = true;

  void passwordVisibility() {
    setState(() => _isObscure = !_isObscure);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
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
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: constraints.maxHeight * .08,
                  ),
                  child: DefaultLogo(),
                ),
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
                    suffixIcon: IconButton(
                      onPressed: () => passwordVisibility(),
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                  obscureText: _isObscure,
                  controller: _passwordController,
                  validator: InputAuthValidators.validatePassword,
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
                        child: Text('ENTRAR'),
                        onPressed: () => authenticate(context),
                      ),
              ],
            ),
          ),
        );
      }),
    );
  }

  authenticate(BuildContext context) async {
    setState(() => _isLoading = !_isLoading);

    if (_formKey.currentState!.validate()) {
      var firebaseAuthApi = Provider.of<FirebaseAuthApi>(
        context,
        listen: false,
      );
      await firebaseAuthApi
          .signIn(
        email: _emailController.text,
        password: _passwordController.text,
      )
          .then((value) {
        if (value is String) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Falha na autenticação'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(value),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
        } else {
          Navigator.pushReplacementNamed(
            context,
            Routes.HOME_BASE_PAGE,
          );
        }
      });
    }

    setState(() => _isLoading = !_isLoading);
  }
}
