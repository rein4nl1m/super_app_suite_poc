import 'package:flutter/material.dart' show Color, LinearGradient, Rect, Shader;

const colorOne = const Color(0xffbe1e2d);
const colorTwo = const Color(0xffef4136);
const colorThree = const Color(0xfff15a29);
const colorFour = const Color(0xfff7941e);
const colorFive = const Color(0xff27aae1);
const colorSix = const Color(0xff1c75bc);
const colorSeven = const Color(0xff2b3990);
const colorEight = const Color(0xff662d91);

final Shader logoGradient = LinearGradient(
  colors: <Color>[
    colorOne,
    colorTwo,
    colorThree,
    colorFour,
    colorFive,
    colorSix,
    colorSeven,
    colorEight,
  ],
).createShader(
  Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
);
