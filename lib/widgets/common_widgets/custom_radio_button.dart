import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  final bool isSelected;

  const CustomRadioButton({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return isSelected ? const Icon(Icons.check_circle) : const Icon(Icons.radio_button_unchecked);
  }
}
