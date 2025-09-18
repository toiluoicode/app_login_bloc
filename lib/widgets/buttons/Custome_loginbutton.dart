import 'package:flutter/material.dart';
class CustomeLoginbutton extends StatelessWidget {
  final VoidCallback? onPressed;
  const CustomeLoginbutton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Login"
              )
            ],
          )
      ),
    );
  }
}
