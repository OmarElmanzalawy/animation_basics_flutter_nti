import 'dart:async';

import 'package:flutter/material.dart';

class SplashAnimation extends StatefulWidget {
  const SplashAnimation({super.key});

  @override
  State<SplashAnimation> createState() => _SplashAnimationState();
}

class _SplashAnimationState extends State<SplashAnimation> with SingleTickerProviderStateMixin{

  late AnimationController animationController;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    scaleAnimation = Tween(begin: 1.0,end: 10.0).animate(animationController);
    super.initState();

    animationController.addListener((){
      print("animation is changing");
      print(scaleAnimation.value);
    });

    animationController.addStatusListener((status){
      // print(status);
      if(status == AnimationStatus.completed){
        Navigator.push(context,PageRouteBuilder(pageBuilder:(context, animation, secondaryAnimation) {
          return Destination();
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation,child: child,);
        },
        ) ).whenComplete((){animationController.reset();});

        // Timer(Duration(milliseconds: 300), (){
        //   animationController.reset();
        // });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: scaleAnimation,
          child: GestureDetector(
            onTap: () {
              animationController.forward();
            },
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Destination extends StatelessWidget {
  const Destination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Go Back'),
      ),
    );
  }
}