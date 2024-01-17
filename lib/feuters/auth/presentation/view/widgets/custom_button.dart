import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, this.onTap, this.child});
  final String title;
  final void Function()? onTap;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
