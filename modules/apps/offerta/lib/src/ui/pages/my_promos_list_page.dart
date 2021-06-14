import 'package:flutter/material.dart';

class MyPromosListPage extends StatefulWidget {
  const MyPromosListPage({Key? key}) : super(key: key);

  @override
  _MyPromosListPageState createState() => _MyPromosListPageState();
}

class _MyPromosListPageState extends State<MyPromosListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Minhas Promoções'),
      ),
    );
  }
}
