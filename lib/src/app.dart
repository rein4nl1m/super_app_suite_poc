import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:mpontom_suite_poc/src/routes/app_page_router.dart';
import 'package:mpontom_suite_poc/src/routes/app_routes.dart';
import 'package:shared/shared.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: injectProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MpontoM Suite POC',
        theme: ThemeData(
          primarySwatch: createMaterialColor(margemPrimaryColor),
        ),
        onGenerateRoute: AppPageRouter.generateRoute,
        initialRoute: Routes.SPLASH,
      ),
    );
  }
}
