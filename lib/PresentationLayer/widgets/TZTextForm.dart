import 'package:flutter/material.dart';
import '../../Constants/colors.dart';
import '../../Constants/font_styles.dart';

class TZTextForm extends StatelessWidget {
  TZTextForm(
      {super.key,
      required this.hint,
      required this.obsecure,
      required this.controller,
      this.type = TextInputType.text});
  final TextEditingController controller;

  final String hint;
  final bool obsecure;
  final TextInputType type;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: mediumNormal,
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.lightblack,
        border: const OutlineInputBorder(),
        hintText: hint,
        hintStyle: mediumNormal.apply(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: AppColors.grey2),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.grey2)),
      ),
      maxLines: 1,
      obscureText: obsecure,
    );
  }
}
