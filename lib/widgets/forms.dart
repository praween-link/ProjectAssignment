import 'package:flutter/material.dart';
import 'package:myassigment/constants/colors.dart';

class Forms {
  static InputDecoration textFromFieldDecoration(
      {required String label, required String hint}) {
    return InputDecoration(
      label: Text(label),
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }

  static Container button({required String title, required double w}) {
    return Container(
      height: 60,
      width: w,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
      ),
      decoration: BoxDecoration(
        color: MyColors.button,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 5,
            spreadRadius: 2,
            color: MyColors.boxSadow,
          ),
        ],
      ),
    );
  }
}
