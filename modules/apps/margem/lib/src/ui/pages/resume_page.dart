import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class ResumePage extends StatefulWidget {
  ResumePage({Key? key}) : super(key: key);

  @override
  _ResumePageState createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Resumo do Grupo"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: ToogleRadioButton(
              optionsList: ['Dia', 'Mês'],
              expanded: false,
              onTap: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
