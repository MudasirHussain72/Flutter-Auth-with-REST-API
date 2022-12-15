// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String hintText;
  var color;
  var icon;
  var controller;
  MyTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      cursorColor: color,
      style: const TextStyle(fontSize: 14, color: Colors.black),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(0),
        ),
        filled: true,
        hintStyle: const TextStyle(color: Color(0xff585A60)),
        hintText: hintText,
        fillColor: const Color(0xffF4F4F4),
        focusColor: const Color(0xffF4F4F4),
        suffixIcon: icon,
      ),
    );
  }
}
