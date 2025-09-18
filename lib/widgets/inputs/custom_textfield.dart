import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obcureText;
  final TextEditingController controller;
  const CustomTextField({super.key, required this.hintText, required this.obcureText, required this.controller});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child:TextField(
        controller: controller,
        obscureText: obcureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(50)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black ),
            borderRadius: BorderRadius.circular(50)
          )
        ),
      ),
    );
  }
}
