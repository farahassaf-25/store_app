import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, this.onTap, required this.text});

  VoidCallback? onTap;
  String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(18),
            ),
            width: double.infinity,
            height: 60,
            child: Center(
              child: Text(
                text,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ));
  }
}
