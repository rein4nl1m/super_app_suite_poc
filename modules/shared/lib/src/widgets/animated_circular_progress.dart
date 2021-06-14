import 'package:flutter/material.dart';

class AnimatedCircularProgress extends StatefulWidget {
  final Color color;
  final double progress;

  AnimatedCircularProgress(
      {Key? key, this.color = Colors.blue, required this.progress})
      : super(key: key);

  @override
  _AnimatedCircularProgressState createState() =>
      _AnimatedCircularProgressState(color, progress);
}

class _AnimatedCircularProgressState extends State<AnimatedCircularProgress> {
  final Color color;
  final double progress;

  _AnimatedCircularProgressState(this.color, this.progress);

  Widget build(BuildContext context) {
    return Container(
      child: TweenAnimationBuilder<double>(
        duration: Duration(milliseconds: 800),
        tween: Tween<double>(
          begin: 0,
          end: progress,
        ),
        builder: (context, value, _) {
          var percent = value / 100;
          return Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    value: percent,
                    backgroundColor: Colors.grey.shade300,
                    valueColor: AlwaysStoppedAnimation(color),
                  ),
                ),
                Text(
                  "${value.toStringAsFixed(0)}%",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
