import 'package:flutter/material.dart';
import '../../../../lib.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final double size;
  final Color checkColor;
  final Color activeColor;
  final Color inactiveColor;

  const CustomCheckbox({
    required this.value,
    required this.onChanged,
    this.size = 20.0,
    this.checkColor = Colors.white,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.transparent,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: value ? activeColor : inactiveColor,
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: value ? activeColor : AppColors.neutral300,
            width: 2,
          ),
        ),
        child: value
            ? Icon(
                Icons.check,
                size: size * 0.6,
                color: checkColor,
              )
            : null,
      ),
    );
  }
}
