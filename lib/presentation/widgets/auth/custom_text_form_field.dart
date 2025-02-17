import 'package:flutter/material.dart'; // Importing Flutter material package for UI components
import 'package:weinds/tokens/colors.dart'; // Importing custom colors from the project

// A stateful widget that builds a custom text form field
class CustomTextFormField extends StatefulWidget {
  final String label; // Label text for the text form field
  final String? errorMessage; // Error message to be displayed
  final FormFieldValidator<String>? validator; // Validator function for the text form field
  final ValueChanged<String>? onChanged; // Callback function to be executed when the text changes
  final TextInputType? keyboardType; // Keyboard type for the text form field
  final bool obscureText; // Whether the text should be obscured (e.g., for passwords)

  // Constructor for CustomTextFormField, requiring label parameter and optional parameters
  const CustomTextFormField({
    super.key,
    required this.label,
    this.onChanged,
    this.errorMessage,
    this.validator,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

// State class for CustomTextFormField
class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late BoxDecoration containerDecoration; // Decoration for the container

  // Default input border style
  final InputBorder defaultInputBorder = InputBorder.none;
  // Default container decoration
  final BoxDecoration defaultContainerDecoration = const BoxDecoration(
    color: Color.fromRGBO(238, 239, 240, 1), // Light grey background color
    borderRadius: BorderRadius.all(Radius.circular(16)), // Rounded corners with a radius of 16
  );
  // Active container decoration when the field is focused
  final BoxDecoration activeContainerDecoration = BoxDecoration(
    color: const Color.fromARGB(255, 228, 228, 245), // Light purple background color
    border: Border.all(color: WeinDsColors.strongPrimary, width: 2), // Border with custom primary color and width 2
    borderRadius: const BorderRadius.all(Radius.circular(16)), // Rounded corners with a radius of 16
  );

  @override
  void initState() {
    super.initState();
    containerDecoration = defaultContainerDecoration; // Initialize container decoration with default
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70, // Container height
      padding: const EdgeInsets.only(left: 45, top: 8), // Padding inside the container
      decoration: containerDecoration, // Apply the container decoration
      child: Focus(
        onFocusChange: (hasFocus) {
          setState(() {
            containerDecoration = hasFocus
                ? activeContainerDecoration // Apply active decoration if focused
                : defaultContainerDecoration; // Apply default decoration if not focused
          });
        },
        child: TextFormField(
          validator: widget.validator, // Apply the validator function
          obscureText: widget.obscureText, // Apply the obscureText property
          keyboardType: widget.keyboardType, // Apply the keyboardType property
          style: const TextStyle(fontSize: 14), // Text style with font size 14
          decoration: InputDecoration(
            isDense: true, // Dense layout for the input decoration
            errorText: widget.errorMessage, // Display the error message if any
            border: defaultInputBorder, // Apply the default input border
            labelText: widget.label, // Display the label text
            labelStyle: const TextStyle(fontSize: 18), // Label text style with font size 18
          ),
          onChanged: widget.onChanged, // Apply the onChanged callback
        ),
      ),
    );
  }
}