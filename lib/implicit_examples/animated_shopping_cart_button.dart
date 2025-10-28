import 'package:flutter/material.dart';

class ShoppingCartButton extends StatefulWidget {
  ShoppingCartButton({super.key});

  @override
  State<ShoppingCartButton> createState() => _ShoppingCartButtonState();
}

class _ShoppingCartButtonState extends State<ShoppingCartButton> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isClicked = !isClicked;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: isClicked ? 200: 80.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: isClicked ? Colors.green : Colors.blue,
              borderRadius: BorderRadius.circular(isClicked ? 25 : 10.0),
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 4,
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                 Flexible(
                  child: AnimatedOpacity(
                    opacity: isClicked ? 1 : 0,
                    duration: Duration(milliseconds: 1500),
                  child: isClicked ? Text("Added to cart",style: TextStyle(color: Colors.white)) : const SizedBox()))
              ],
            ),
          ),
        ),
      ),
    );
  }
}