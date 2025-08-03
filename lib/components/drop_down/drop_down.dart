import 'package:flutter/material.dart';

class DropDownContainer extends StatelessWidget {
  const DropDownContainer({
    super.key,
    required this.dropdownName,
    required this.items,
    required this.onChanged,
  });

  final String? dropdownName;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: DropdownButton<String>(
        value: dropdownName,
        underline: const SizedBox(),
        items: items.map((e) {
          return DropdownMenuItem<String>(
            value: e,
            child: Text(
              e,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
