import 'package:flutter/material.dart';
import 'package:weinds/tokens/colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final String? errorMessage;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final bool obscureText;

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
      height: 70,
      padding: const EdgeInsets.only(left: 45, top: 8),
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
          keyboardType: widget.keyboardType,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            isDense: true,
            errorText: widget.errorMessage,
            border: defaultInputBorder,
            labelText: widget.label,
            labelStyle: const TextStyle(fontSize: 18),
          ),
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
