library offerta;

import 'package:flutter/material.dart';
import 'package:offerta/src/ui/pages/offerta_home_page.dart';
import 'package:shared/shared.dart';

class OffertaApp extends StatefulWidget {
  const OffertaApp({Key? key}) : super(key: key);

  @override
  _OffertaAppState createState() => _OffertaAppState();
}

class _OffertaAppState extends State<OffertaApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offertaPrimaryColor,
      body: OffertaHomePage(),
    );
  }
}
