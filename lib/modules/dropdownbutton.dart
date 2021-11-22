import 'package:flutter/material.dart';

class ToolbarDropdownButton extends StatefulWidget {
  ToolbarDropdownButton({Key? key, required this.dropdownValue})
      : super(key: key);

  String dropdownValue;
  @override
  _ToolbarDropdownButtonState createState() => _ToolbarDropdownButtonState();
}

class _ToolbarDropdownButtonState extends State<ToolbarDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.dropdownValue,
      icon: const Icon(
        Icons.arrow_downward,
        color: Colors.white,
      ),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(fontSize: 21.0),
      onChanged: (String? newValue) {
        setState(() {
          widget.dropdownValue = newValue!;
        });
      },
      items: <String>['Daily forecast', 'Hourly forecast']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
