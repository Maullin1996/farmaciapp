import 'package:flutter/material.dart';
import 'package:weinds/tokens/colors.dart';

Widget buildButton(String text, VoidCallback onPressed) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onPressed: onPressed,
      height: 75,
      minWidth: double.infinity,
      color: WeinDsColors.strongPrimary,
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 35)),
    );
}
