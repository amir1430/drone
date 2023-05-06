import 'package:flutter/material.dart';

typedef OnChange = void Function(String value)?;

class DroneTextField extends StatelessWidget {
  const DroneTextField({
    super.key,
    this.label,
    this.enabled,
    this.controller,
    this.onChange,
    this.errorText,
    this.elevation = 0,
    this.initialValue,
    this.color = Colors.white,
    this.border = InputBorder.none,
  });

  final String? label;
  final String? errorText;
  final bool? enabled;
  final TextEditingController? controller;
  final double elevation;
  final Color color;
  final OnChange onChange;
  final String? initialValue;
  final InputBorder border;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      enabled: enabled,
      controller: controller,
      onChanged: onChange,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white70,
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey.shade700, fontSize: 16),
        floatingLabelStyle:
            TextStyle(color: Theme.of(context).colorScheme.secondary),
        errorText: errorText,
        border: OutlineInputBorder(
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 228, 228, 228)),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 228, 228, 228)),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 12,
        ),
      ),
    );
  }
}
