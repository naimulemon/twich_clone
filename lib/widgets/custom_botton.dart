import 'package:flutter/material.dart';
import 'package:twich_clone/utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, required this.ontap}) : super(key: key);
  final String text;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          minimumSize: const Size(double.infinity, 40),
        ),
        onPressed: ontap,
        child: Text(text));
  }
}
