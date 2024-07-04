import 'package:flutter/material.dart';
import '../.././../../lib.dart';

class CustomMenuItem extends StatelessWidget {
  final String _label;
  final String _icon;
  final int _maxLine;
  const CustomMenuItem(
    String label, {
    super.key,
    required String icon,
    int maxLine = 1,
  })  : _icon = icon,
        _label = label,
        _maxLine = maxLine;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.neutral200,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: CustomImageWrapper(
            image: _icon,
            width: 25,
            height: 22,
            isNetworkImage: false,
          ),
        ),
        const Gap(height: 4),
        Visibility(
          visible: _label.trim().isNotEmpty,
          child: Text(
            _label,
            style: AppTextStyle.regular.copyWith(
              color: AppColors.neutral500,
              fontSize: AppFontSize.small,
            ),
            maxLines: _maxLine,
          ),
        ),
        Visibility(
          visible: _label.trim().isEmpty,
          child: const Gap(),
        )
      ],
    );
  }
}
