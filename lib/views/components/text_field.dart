import 'package:flutter/material.dart';

Widget buildTextField(
  String label,
  TextEditingController controller, {
  bool readOnly = false,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      readOnly: readOnly,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 111, 183, 31),
            width: 2, // Border width
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 111, 183, 31),
            width: 2, // Border width
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 111, 183, 31),
            width: 2, // Border width
          ),
        ),
      ),
    ),
  );
}
