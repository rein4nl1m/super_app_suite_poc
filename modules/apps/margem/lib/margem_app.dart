library margem;

import 'package:flutter/material.dart';
import 'package:margem/src/ui/pages/store_page.dart';
import 'package:shared/shared.dart';

class MargemApp extends StatefulWidget {
  const MargemApp({Key? key}) : super(key: key);

  @override
  _MargemAppState createState() => _MargemAppState();
}

class _MargemAppState extends State<MargemApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: margemPrimaryColor,
      body: StorePage(),
    );
  }
}
