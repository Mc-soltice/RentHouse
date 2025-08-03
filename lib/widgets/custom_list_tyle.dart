import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool? switchValue;
  final ValueChanged<bool>? onSwitchChanged;

  const MyListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.switchValue,
    this.onSwitchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.black),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      trailing: switchValue != null
          ? Switch(
              value: switchValue!,
              onChanged: onSwitchChanged,
              activeColor: Colors.white,
              activeTrackColor: Colors.green[800],
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey[400],
            )
          : const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
