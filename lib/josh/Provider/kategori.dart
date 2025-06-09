import 'package:flutter/material.dart';

class RadioKategori extends StatelessWidget {
  final String value;
  final String groupValue;
  final void Function(String?) onChanged;

  const RadioKategori({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Radio(value: value, groupValue: groupValue, onChanged: onChanged),
          Text(value)
        ],
      ),
    );
  }
}
