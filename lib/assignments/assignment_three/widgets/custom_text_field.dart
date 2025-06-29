import 'package:flutter/material.dart';
import 'package:flutter_assignments/helpers/accessories_styles.dart';
import 'package:tailwind_standards/tailwind_standards.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final String? Function(String?) validator;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final bool readOnly;

  final bool? obscureText;
  final bool? isEmail;
  final bool? isPhone;
  
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.label,
      required this.hint, 
      required this.validator, 
      required this.keyboardType, 
      this.prefixIcon, 
      this.readOnly = false, 
      this.obscureText = false, 
      this.isEmail, 
      this.isPhone});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(label, style: formTextStyle),
        const SizedBox(height: 10),

        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          readOnly: readOnly,
          obscureText: obscureText!,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: prefixIcon,
            border: formInputBorder,
            focusedBorder: formFocusedBorder,
            enabledBorder: formInputBorder,
            filled: true,
            fillColor: TColor.slate200,
            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15)
          ),
        )
      ],
    );
  }
}