import 'package:flutter/material.dart';

class StoresListPage extends StatefulWidget {
  const StoresListPage({Key? key}) : super(key: key);

  @override
  _StoresListPageState createState() => _StoresListPageState();
}

class _StoresListPageState extends State<StoresListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Minhas Lojas'),
      ),
    );
  }
}
