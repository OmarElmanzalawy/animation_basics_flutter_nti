import 'package:flutter/material.dart';

class PulsatingCircleAnimation extends StatelessWidget {
  PulsatingCircleAnimation({super.key});
  // final double size = 200;
  final Tween<double> sizeTween = Tween(begin: 0,end: 200);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pulsating Circle Animation'),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          tween: sizeTween,
          duration: Duration(milliseconds: 600),
          builder:(context, value, child) {
            print("rebuild");
            print(value);
            return Container(
              alignment: Alignment.center,
            width: value,
            height: value,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.5),
                  blurRadius: value,
                  spreadRadius: value / 2,
                ),
              ],
            ),
            child: child,
          );
          } ,
          child: Text("Hello world"), //static
        ),
      ),
    );
  }
}