import 'package:flutter/material.dart'; // Importing Flutter material package for UI components
import 'package:weinds/tokens/colors.dart'; // Importing custom colors from the project

// A stateless widget that builds a custom button
class BuildButton extends StatelessWidget {
  final String text; // Text to be displayed on the button
  final VoidCallback onPressed; // Callback function to be executed when the button is pressed

  // Constructor for BuildButton, requiring text and onPressed parameters
  const BuildButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), // Rounded corners with a radius of 16
      onPressed: onPressed, // Setting the onPressed callback
      height: 60, // Button height
      minWidth: double.infinity, // Button width to fill the parent container
      color: WeinDsColors.strongPrimary, // Button background color from custom colors
      child: Text(
        text, // Displaying the text on the button
        style: TextStyle(color: Colors.white, fontSize: 16), // Text style with white color and font size 16
      ),
    );
  }
}