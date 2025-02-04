import 'package:flutter/material.dart';
import 'package:weinds/tokens/colors.dart';

class BuildButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const BuildButton({super.key, required this.text, required this.onPressed});

  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onPressed: onPressed,
      height: 75,
      minWidth: double.infinity,
      color: WeinDsColors.strongPrimary,
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 35)),
    );
  }
}
