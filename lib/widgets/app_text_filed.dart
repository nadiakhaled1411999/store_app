import 'package:flutter/material.dart';

class AppTextFiled extends StatelessWidget {
  const AppTextFiled(
      {super.key, this.hintText, this.onChanged, this.obscureText = false, this.inputType});
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final bool? obscureText;
  final  TextInputType?  inputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText!,
      keyboardType: inputType,
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          fillColor: Colors.transparent,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 112, 105, 240)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueAccent,
            ),
          )),
    );
  }
}
