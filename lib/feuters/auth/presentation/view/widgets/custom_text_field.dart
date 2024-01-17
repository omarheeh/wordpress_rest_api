import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.validator,
    this.icon,
    this.controller,
  });
  final String? hintText;
  final String? Function(String?)? validator;
  final IconData? icon;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 2,
          ),
        ),
      ),
    );
  }
}
