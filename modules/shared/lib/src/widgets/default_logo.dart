import 'package:flutter/material.dart';
import 'package:shared/src/common/styles/logo_colors.dart';

class DefaultLogo extends StatelessWidget {
  const DefaultLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'MpontoM',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              foreground: Paint()..shader = logoGradient,
            ),
          ),
          Text(
            'Suite',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
