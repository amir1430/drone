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
    this.elevation = 4,
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
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(12),
      color: color,
      shadowColor: Theme.of(context).colorScheme.primary.withOpacity(.1),
      elevation: elevation,
      child: TextFormField(
        initialValue: initialValue,
        enabled: enabled,
        controller: controller,
        onChanged: onChange,
        decoration: InputDecoration(
          labelText: label,
          errorText: errorText,
          // labelStyle: const TextStyle(fontSize: ),
          border: border,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
        ),
      ),
    );
  }
}
