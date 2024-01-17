import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    required this.title,
    this.fontSize,
  });
  final String title;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.purple,
      highlightColor: Color.fromARGB(255, 128, 32, 231),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
