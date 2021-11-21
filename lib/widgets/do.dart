import 'package:flutter/material.dart';
import 'package:mae/app_data.dart';
import 'package:slidable_button/slidable_button.dart';

class DoButton extends StatelessWidget {
  const DoButton(this.onChanged, {Key? key}) : super(key: key);

  final void Function(SlidableButtonPosition position) onChanged;

  @override
  Widget build(BuildContext context) {
    return SlidableButton(
      onChanged: onChanged,
      height: 64,
      label: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: fabColor,
        ),
        child: const Icon(
          Icons.keyboard_arrow_right_rounded,
          size: 64,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: fabColor.withOpacity(0.2),
        ),
        child: const Center(
          child: Text(
            "Deslice para confirmar la operación.",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
      dismissible: true,
    );
  }
}
