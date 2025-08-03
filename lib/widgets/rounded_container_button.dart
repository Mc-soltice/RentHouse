import 'package:flutter/material.dart';
import 'package:renthouse/utiles/colors/color.dart';

class RoundedContainerButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget child;
  final VoidCallback onTap;

  const RoundedContainerButton({
    super.key,
    required this.width,
    required this.height,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height, // peut rester null si non spécifié
        decoration: BoxDecoration(
          color:buttonColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: child,
          ),
        ),
      ),
    );
  }
}
