import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class DailyAnalysisPanel extends StatelessWidget {
  final VoidCallback? backFunction;

  DailyAnalysisPanel({this.backFunction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: backFunction != null,
        leading:
            backFunction != null ? BackButton(onPressed: backFunction) : null,
        iconTheme: IconThemeData(color: margemPrimaryColor),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Análise Diária',
          style: TextStyle(color: margemPrimaryColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AnimatedCircularProgress(progress: 70),
              AnimatedCircularProgress(progress: 53, color: Colors.amber),
              AnimatedCircularProgress(progress: 98, color: Colors.green),
            ],
          ),
        ),
      ),
    );
  }
}
