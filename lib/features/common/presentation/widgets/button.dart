import 'package:flutter/material.dart';
import './../../.././../lib.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary(
    String label, {
    Key? key,
    required Function() onPressed,
    TextAlign textAlign = TextAlign.center,
    bool isButtonDisabled = false,
    FontWeight fontWeight = AppFontWeight.bold,
    Color buttonColor = AppColors.primary,
    Color labelColor = AppColors.neutral100,
    Color borderColor = Colors.transparent,
    double borderWidth = 1,
    double borderRadius = AppBorderRadius.tiny,
    double fontSize = AppFontSize.normal,
    double paddingVertical = 0,
    double paddingHorizontal = AppGap.normal,
    double? height,
    double? width,
    double? elevation,
    TextDecoration? textDecoration,
  })  : _label = label,
        _onPressed = onPressed,
        _textAlign = textAlign,
        _fontWeight = fontWeight,
        _buttonColor = buttonColor,
        _labelColor = labelColor,
        _isButtonDisabled = isButtonDisabled,
        _borderColor = borderColor,
        _borderWidth = borderWidth,
        _borderRadius = borderRadius,
        _fontSize = fontSize,
        _paddingVertical = paddingVertical,
        _paddingHorizontal = paddingHorizontal,
        _height = height,
        _width = width,
        _elevation = elevation,
        _textDecoration = textDecoration,
        super(key: key);

  final String _label;
  final Function() _onPressed;
  final TextAlign _textAlign;
  final FontWeight _fontWeight;
  final Color _buttonColor;
  final Color? _labelColor;
  final Color _borderColor;
  final double _borderWidth;
  final bool _isButtonDisabled;
  final double _borderRadius;
  final double _fontSize;
  final double _paddingVertical;
  final double _paddingHorizontal;
  final double? _height;
  final double? _width;
  final TextDecoration? _textDecoration;
  final double? _elevation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
      height: _height ??
          ResponsiveUtils(context).getResponsiveSize(
            AppButtonSize.normal,
          ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: _elevation,
          backgroundColor: _buttonColor,
          padding: EdgeInsets.symmetric(
            vertical: _paddingVertical,
            horizontal: _paddingHorizontal,
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          side: BorderSide(color: _borderColor, width: _borderWidth),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              _borderRadius,
            ),
          ),
        ),
        onPressed: _isButtonDisabled ? null : _onPressed,
        child: Text(
          _label,
          style: TextStyle(
            fontSize: _fontSize,
            color: _labelColor,
            fontWeight: _fontWeight,
            decoration: _textDecoration,
          ),
          textAlign: _textAlign,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class ButtonWithCenterIcon extends StatelessWidget {
  const ButtonWithCenterIcon(
    String label, {
    Key? key,
    required String icon,
    required Function() onPressed,
    TextAlign textAlign = TextAlign.center,
    bool isButtonDisabled = false,
    required bool isIconSvg,
    FontWeight fontWeight = AppFontWeight.bold,
    Color buttonColor = AppColors.primary,
    Color labelColor = AppColors.neutral100,
    Color borderColor = Colors.transparent,
    double borderWidth = 1,
    double borderRadius = AppBorderRadius.tiny,
    double fontSize = AppFontSize.normal,
    double paddingVertical = 0,
    double paddingHorizontal = AppGap.normal,
    double? height,
    double? width,
    double? elevation,
    TextDecoration? textDecoration,
  })  : _label = label,
        _onPressed = onPressed,
        _textAlign = textAlign,
        _fontWeight = fontWeight,
        _buttonColor = buttonColor,
        _labelColor = labelColor,
        _isButtonDisabled = isButtonDisabled,
        _borderColor = borderColor,
        _borderWidth = borderWidth,
        _borderRadius = borderRadius,
        _fontSize = fontSize,
        _paddingVertical = paddingVertical,
        _paddingHorizontal = paddingHorizontal,
        _height = height,
        _width = width,
        _elevation = elevation,
        _textDecoration = textDecoration,
        _isIconSvg = isIconSvg,
        _icon = icon,
        super(key: key);

  final String _label;
  final Function() _onPressed;
  final TextAlign _textAlign;
  final FontWeight _fontWeight;
  final Color _buttonColor;
  final Color? _labelColor;
  final Color _borderColor;
  final double _borderWidth;
  final bool _isButtonDisabled;
  final double _borderRadius;
  final double _fontSize;
  final double _paddingVertical;
  final double _paddingHorizontal;
  final double? _height;
  final double? _width;
  final TextDecoration? _textDecoration;
  final double? _elevation;
  final bool _isIconSvg;
  final String _icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
      height: _height ??
          ResponsiveUtils(context).getResponsiveSize(
            AppButtonSize.normal,
          ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: _elevation,
          backgroundColor: _buttonColor,
          padding: EdgeInsets.symmetric(
            vertical: _paddingVertical,
            horizontal: _paddingHorizontal,
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          side: BorderSide(color: _borderColor, width: _borderWidth),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              _borderRadius,
            ),
          ),
        ),
        onPressed: _isButtonDisabled ? null : _onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _isIconSvg
                ? CustomSvgWrapper(
                    svgPath: _icon,
                    width: 20,
                    height: 20,
                    isNetwork: false,
                  )
                : CustomImageWrapper(
                    image: _icon,
                    width: 20,
                    height: 20,
                    isNetworkImage: false,
                  ),
            const Gap(width: 5),
            Text(
              _label,
              style: TextStyle(
                fontSize: _fontSize,
                color: _labelColor,
                fontWeight: _fontWeight,
                decoration: _textDecoration,
              ),
              textAlign: _textAlign,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonIcon extends StatelessWidget {
  const ButtonIcon(
    String label, {
    Key? key,
    required String icon,
    required Function() onPressed,
    TextAlign textAlign = TextAlign.center,
    bool isButtonDisabled = false,
    required bool isIconSvg,
    FontWeight fontWeight = AppFontWeight.bold,
    Color buttonColor = AppColors.primary,
    Color labelColor = AppColors.neutral100,
    Color borderColor = Colors.transparent,
    double borderWidth = 1,
    double borderRadius = AppBorderRadius.tiny,
    double fontSize = AppFontSize.normal,
    double paddingVertical = 0,
    double paddingHorizontal = AppGap.normal,
    double? height,
    double? width,
    double? elevation,
    TextDecoration? textDecoration,
  })  : _label = label,
        _onPressed = onPressed,
        _textAlign = textAlign,
        _fontWeight = fontWeight,
        _buttonColor = buttonColor,
        _labelColor = labelColor,
        _isButtonDisabled = isButtonDisabled,
        _borderColor = borderColor,
        _borderWidth = borderWidth,
        _borderRadius = borderRadius,
        _fontSize = fontSize,
        _paddingVertical = paddingVertical,
        _paddingHorizontal = paddingHorizontal,
        _height = height,
        _width = width,
        _elevation = elevation,
        _textDecoration = textDecoration,
        _isIconSvg = isIconSvg,
        _icon = icon,
        super(key: key);

  final String _label;
  final Function() _onPressed;
  final TextAlign _textAlign;
  final FontWeight _fontWeight;
  final Color _buttonColor;
  final Color? _labelColor;
  final Color _borderColor;
  final double _borderWidth;
  final bool _isButtonDisabled;
  final double _borderRadius;
  final double _fontSize;
  final double _paddingVertical;
  final double _paddingHorizontal;
  final double? _height;
  final double? _width;
  final TextDecoration? _textDecoration;
  final double? _elevation;
  final bool _isIconSvg;
  final String _icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
      height: _height ??
          ResponsiveUtils(context).getResponsiveSize(
            AppButtonSize.normal,
          ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: _elevation,
              backgroundColor: _buttonColor,
              padding: EdgeInsets.symmetric(
                vertical: _paddingVertical,
                horizontal: _paddingHorizontal,
              ),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              side: BorderSide(color: _borderColor, width: _borderWidth),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  _borderRadius,
                ),
              ),
            ),
            onPressed: _isButtonDisabled ? null : _onPressed,
            child: _isIconSvg
                ? CustomSvgWrapper(
                    svgPath: _icon,
                    width: 20,
                    height: 20,
                    isNetwork: false,
                  )
                : CustomImageWrapper(
                    image: _icon,
                    width: 20,
                    height: 20,
                    isNetworkImage: false,
                  ),
          ),
          Visibility(
            visible: _label.trim().isNotEmpty,
            child: Text(
              _label,
              style: TextStyle(
                fontSize: _fontSize,
                color: _labelColor,
                fontWeight: _fontWeight,
                decoration: _textDecoration,
              ),
              textAlign: _textAlign,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Visibility(
            visible: _label.trim().isEmpty,
            child: const Gap(),
          )
        ],
      ),
    );
  }
}
