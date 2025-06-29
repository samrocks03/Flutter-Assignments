// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpInputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final VoidCallback? onChanged;
  final bool isActive;


  const OtpInputField({
    super.key,
    required this.isActive,
    required this.controller,
    this.focusNode,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,

      decoration: BoxDecoration(
        border: Border.all(
          color: isActive ? Colors.orange : Colors.grey.shade300,
          width: isActive ? 2 : 1,
        ),

        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade50,
      ),

      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,

        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),

        decoration: const InputDecoration(
          counterText: '',
          border: InputBorder.none,
        ),

        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],

        onChanged: (value) {
          if (value.isNotEmpty) {
            onChanged?.call();
          }
        },

        validator: (value) {
          if (value == null || value.isEmpty) {
            return '';
          }
          return null;
        }
      ),

    );
  }
}
