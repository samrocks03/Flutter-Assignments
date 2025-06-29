import 'package:flutter/material.dart';

final ButtonStyle roundedElevatedButtonStyle = ElevatedButton.styleFrom(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20), 
  ),
);

final TextStyle formTextStyle = TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500, 
                color: Colors.black87
              );

final InputBorder formInputBorder = OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.grey),
            );

final InputBorder formFocusedBorder = OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.orange, width: 2),
            );