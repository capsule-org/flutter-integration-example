import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String value;
  final ValueChanged<String> onChanged;
  final String placeholder;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final bool multiline;

  const CustomInput({
    super.key,
    required this.value,
    required this.onChanged,
    required this.placeholder,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.multiline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: TextEditingController(text: value),
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: placeholder,
          hintStyle: const TextStyle(color: Color(0xFF999999)),
          contentPadding: const EdgeInsets.all(16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(fontSize: 16),
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        maxLines: multiline ? null : 1,
      ),
    );
  }
}
