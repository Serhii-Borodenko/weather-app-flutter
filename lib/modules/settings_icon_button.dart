import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsIconButton extends StatelessWidget {
  const SettingsIconButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.settings,
        ));
  }
}
