import 'package:flutter/material.dart';

class ListAnimation extends StatefulWidget {
  const ListAnimation({super.key});

  @override
  State<ListAnimation> createState() => _ListAnimationState();
}

class _ListAnimationState extends State<ListAnimation> with SingleTickerProviderStateMixin{

  late AnimationController animationController;
  late List<Animation<Offset>> offsetAnimation;

  @override
  void initState() {
    animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 700));
    // offsetAnimation = Tween(begin: Offset(-1, 0), end: Offset.zero).animate(animationController);
    offsetAnimation = List.generate(5, (index) => Tween(begin: Offset(-1,0),end: Offset.zero).animate(CurvedAnimation(
      parent: animationController,
       curve: Interval(
        index / 5,
         (index + 1) / 5
         )),

       ));


    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Animation'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return SlideTransition(
            position: offsetAnimation[index],
            child: ListTile(
              title: Text('Hello World, Rivaan. ${index.toString()}'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(animationController.status == AnimationStatus.completed){
            animationController.reverse();
          }else{
            animationController.forward();
          }
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}