import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final String label;
  bool isPassword;
  final String? initialValue;
  final Function(String)? onChange;
  final String? Function(String?)? validator;

  FormTextField({
    required this.label,
    this.isPassword = false,
    super.key,
    this.initialValue,
    this.onChange,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      obscureText: isPassword,
      onChanged: onChange,
      validator: validator,
      decoration: InputDecoration(labelText: label),
    );
  }
}
