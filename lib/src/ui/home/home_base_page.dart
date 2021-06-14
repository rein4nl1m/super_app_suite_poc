import 'package:core/data/models/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:margem/margem_app.dart';
import 'package:mpontom_suite_poc/src/routes/app_routes.dart';
import 'package:offerta/offerta_app.dart';
import 'package:provider/provider.dart';
import 'package:core/core.dart';
import 'package:shared/shared.dart';

class HomeBasePage extends StatefulWidget {
  const HomeBasePage({Key? key}) : super(key: key);

  @override
  _HomeBasePageState createState() => _HomeBasePageState();
}

class _HomeBasePageState extends State<HomeBasePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Color defaultColor = margemPrimaryColor;
  Widget appBody = MargemApp();
  bool margemSelected = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var userBloc = Provider.of<UserBloc>(context, listen: false);
    return Scaffold(
      key: _scaffoldKey,
      drawer: basicDrawer(context),
      backgroundColor: defaultColor,
      body: StreamBuilder<UserProfile?>(
          stream: userBloc.userProfile,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            UserProfile? currentProfile = snapshot.data;
            return SafeArea(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Row(
                      children: [
                        IconButton(
                          color: Colors.white,
                          onPressed: () {
                            _scaffoldKey.currentState!.openDrawer();
                          },
                          icon: Icon(Icons.menu),
                        ),
                        Visibility(
                          visible: currentProfile!.isMargemUser ?? false,
                          child: Expanded(
                            child: Material(
                              elevation: margemSelected ? 5 : 0,
                              child: InkWell(
                                child: Container(
                                  alignment: Alignment.center,
                                  height: size.height * .05,
                                  color: margemPrimaryColor,
                                  child: Text(
                                    'Margem',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(
                                    () {
                                      margemSelected = true;
                                      defaultColor = margemPrimaryColor;
                                      appBody = MargemApp();
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: currentProfile.isOffertaUser ?? false,
                          child: Expanded(
                            child: Material(
                              elevation: margemSelected ? 0 : 5,
                              child: InkWell(
                                child: Container(
                                  alignment: Alignment.center,
                                  height: size.height * .05,
                                  color: offertaPrimaryColor,
                                  child: Text(
                                    'Offerta',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    margemSelected = false;
                                    defaultColor = offertaPrimaryColor;
                                    appBody = OffertaApp();
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: appBody,
                  ),
                ],
              ),
            );
          }),
    );
  }

  Drawer basicDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              var firebaseAuthApi = Provider.of<FirebaseAuthApi>(
                context,
                listen: false,
              );
              firebaseAuthApi.signOut();
              Navigator.pushReplacementNamed(context, Routes.PRE_AUTH);
            },
            child: Text('Sair'),
          )
        ],
      ),
    );
  }
}
