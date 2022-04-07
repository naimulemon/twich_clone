import 'package:flutter/material.dart';
import 'package:twich_clone/utils/colors.dart';

class CoustomTextField extends StatelessWidget {
  final TextEditingController controller;
  const CoustomTextField({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: buttonColor,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: secondaryBackgroundCOlor,
            )
        ),
      ),
    );
  }
}
