import 'package:flutter/material.dart';
import 'package:weinds/tokens/colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final String? errorMessage;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool obscureText;

  const CustomTextFormField({
    this.obscureText = false,
    super.key,
    required this.label,
    this.controller,
    this.onChanged, 
    this.errorMessage, 
    this.validator,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late BoxDecoration containerDecoration;

  final InputBorder defaultInputBorder = InputBorder.none;
  final BoxDecoration defaultContainerDecoration = const BoxDecoration(
    color: Color.fromRGBO(238, 239, 240, 1),
    borderRadius: BorderRadius.all(Radius.circular(16)),
  );
  final BoxDecoration activeContainerDecoration = BoxDecoration(
    color: const Color.fromARGB(255, 228, 228, 245),
    border: Border.all(color: WeinDsColors.strongPrimary, width: 2),
    borderRadius: const BorderRadius.all(Radius.circular(16)),
  );

  @override
  void initState() {
    super.initState();
    containerDecoration = defaultContainerDecoration;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      padding: const EdgeInsets.only(left: 45),
      decoration: containerDecoration,
      child: Focus(
        onFocusChange: (hasFocus) {
          setState(() {
            containerDecoration = hasFocus
                ? activeContainerDecoration
                : defaultContainerDecoration;
          });
        },
        child: TextFormField(
          validator: widget.validator,
          obscureText: widget.obscureText,
          controller: widget.controller,
          style: const TextStyle(fontSize: 25),
          decoration: InputDecoration(
            isDense: true,
            errorText: widget.errorMessage,
            border: defaultInputBorder,
            labelText: widget.label,
            labelStyle: const TextStyle(fontSize: 22),
          ),
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
