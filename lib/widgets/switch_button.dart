import 'package:flutter/material.dart';

class CustomSwitchExample extends StatefulWidget {
  const CustomSwitchExample({super.key});

  @override
  State<CustomSwitchExample> createState() => _CustomSwitchExampleState();
}

class _CustomSwitchExampleState extends State<CustomSwitchExample> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Switch(
        value: isSwitched,
        onChanged: (value) {
          setState(() {
            isSwitched = value;
          });
        },
        activeColor: Colors.white,              // couleur du cercle
        activeTrackColor: Colors.green[700],    // couleur de fond ON
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Colors.grey.shade100,   // couleur de fond OFF
      ),
    );
  }
}
