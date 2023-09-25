import 'package:flutter/material.dart';
import 'package:untitled/constants/constants.dart';

class NewTextButton extends StatelessWidget {
  const NewTextButton({super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingMedium),
      child: SizedBox(
        height: 30,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 5,
            side: const BorderSide(color: Colors.blueGrey, width: 2),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(color:  Colors.blueGrey),
          ),
        ),
      ),
    );
  }
}
