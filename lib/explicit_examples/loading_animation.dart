import 'package:flutter/material.dart';

class RadialProgressAnimation extends StatefulWidget {
  final double progress;
  final Color color;

  const RadialProgressAnimation({
    super.key,
    required this.progress,
    required this.color,
  });

  @override
  State<RadialProgressAnimation> createState() => _RadialProgressAnimationState();
}

class _RadialProgressAnimationState extends State<RadialProgressAnimation> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<double> progressAnimation;

  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500)
    );
    progressAnimation = Tween(begin: 0.0,end: widget.progress).animate(CurvedAnimation(parent: animationController, curve: Curves.bounceIn) );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: progressAnimation,
          builder:(context, child) {
            print("rebuild");
            print(progressAnimation.value);
            return Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: CircularProgressIndicator(
                  value: progressAnimation.value,
                  strokeWidth: 10,
                  backgroundColor: Colors.grey.shade100,
                  color: widget.color,
                ),
              ),
              Text(
                '${(progressAnimation.value * 100).toInt()}%',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
          } 
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(animationController.status == AnimationStatus.completed){
            animationController.reverse();
          }
          else{
            animationController.forward();
          }
          
        },
        child: const Icon(Icons.start),
      ),
    );
  }
}