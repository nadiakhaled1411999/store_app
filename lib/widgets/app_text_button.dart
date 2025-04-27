import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
   AppTextButton({super.key, required this.text, this.onPressed});
  final String text;
  VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all<Size>(const Size(200, 50)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(Color.fromARGB(255, 112, 105, 240)),
      ),
      onPressed:onPressed,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
