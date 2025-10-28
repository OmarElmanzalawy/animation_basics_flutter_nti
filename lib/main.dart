import 'package:animation_basics_flutter/explicit_examples/list_animation.dart';
import 'package:animation_basics_flutter/explicit_examples/loading_animation.dart';
import 'package:animation_basics_flutter/explicit_examples/login_animation.dart';
import 'package:animation_basics_flutter/implicit_examples/animated_color_pallete.dart';
import 'package:animation_basics_flutter/implicit_examples/animated_shopping_cart_button.dart';
import 'package:animation_basics_flutter/implicit_examples/animated_tween_animation_builder_example.dart';
import 'package:animation_basics_flutter/page_route_builder_animation/splash_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashAnimation()
    );
  }
}
