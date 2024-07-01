import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../lib.dart';

/// Custom Widget for Text Form Field
/// This text field has validator to check the user input
/// An error will be shown below the text field if the input doesn't meet the validator
///
/// This text field border will change dynamically according to user interaction & input
///
/// This text field can be used for typing password and has a trigger for visibility
/// An icon will be shown if the type of input is password
/// The icon will be the visibility trigger
class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    required TextFieldEntity textFieldEntity,
    int maxLines = 1,
    Color backgroundDisable = TextFieldColors.backgroundDisable,
    String? Function(String?)? validator,
    Function(String)? onChanged,
    int? maxLength,
    Widget? widgetSuffix,
    Widget? widgetPrefix,
  })  : _textFieldEntity = textFieldEntity,
        _maxLines = maxLines,
        _backgroundDisable = backgroundDisable,
        _validator = validator,
        _onChanged = onChanged,
        _maxLength = maxLength,
        _widgetSuffix = widgetSuffix,
        _widgetPrefix = widgetPrefix,
        super(key: key);

  final TextFieldEntity _textFieldEntity;
  final int _maxLines;
  final Color _backgroundDisable;
  final String? Function(String?)? _validator;
  final Function(String)? _onChanged;
  final int? _maxLength;
  final Widget? _widgetSuffix;
  final Widget? _widgetPrefix;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isObscureText = false;

  @override
  void initState() {
    _isObscureText = widget._textFieldEntity.isPassword;

    widget._textFieldEntity.focusNode?.addListener(() {
      if (widget._textFieldEntity.focusNode?.hasFocus ?? false) {
        FocusScope.of(context).requestFocus(widget._textFieldEntity.focusNode);
      } else {
        widget._textFieldEntity.focusNode?.unfocus();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget._textFieldEntity.label.trim().isNotEmpty,
          child: Text(
            widget._textFieldEntity.label,
            style: AppTextStyle.semiBold,
          ),
        ),
        Visibility(
          visible: widget._textFieldEntity.label.trim().isNotEmpty,
          child: const Gap(),
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: widget._textFieldEntity.textController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                textInputAction: widget._textFieldEntity.textInputAction,
                enabled: widget._textFieldEntity.isEnabled,
                keyboardType: widget._textFieldEntity.keyboardType,
                inputFormatters: widget._textFieldEntity.inputFormatters,
                maxLines: widget._maxLines,
                onChanged: widget._onChanged,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  hintText: widget._textFieldEntity.hint,
                  counterText: "",
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  hintStyle: AppTextStyle.regular.copyWith(
                    color: AppColors.neutral300,
                  ),
                  contentPadding: const EdgeInsets.all(12),
                  filled: true,
                  fillColor: widget._textFieldEntity.isEnabled
                      ? const Color.fromRGBO(
                          243,
                          244,
                          246,
                          1,
                        ) //TextFieldColors.backgroundEnable
                      : widget._backgroundDisable,
                  suffixIcon: Visibility(
                    visible: widget._textFieldEntity.isPassword,
                    child: IconButton(
                      color: AppColors.neutral300,
                      icon: Icon(
                        _isObscureText
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscureText = !_isObscureText;
                        });
                      },
                    ),
                  ),
                  prefixIcon: widget._widgetPrefix,
                  errorStyle: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                maxLength: widget._maxLength,
                style: AppTextStyle.regular.copyWith(
                  color: AppColors.neutral400,
                ),
                obscureText: _isObscureText,
                validator:
                    widget._validator ?? widget._textFieldEntity.validator,
              ),
            ),
            widget._widgetSuffix ?? const SizedBox(),
          ],
        ),
      ],
    );
  }
}

class CustomTextFormFieldOtp extends StatefulWidget {
  const CustomTextFormFieldOtp({
    Key? key,
    required TextFieldEntity textFieldEntity,
    required Function(String)? onChanged,
  })  : _textFieldEntity = textFieldEntity,
        _onChanged = onChanged,
        super(key: key);

  final TextFieldEntity _textFieldEntity;
  final Function(String)? _onChanged;

  @override
  State<CustomTextFormFieldOtp> createState() => _CustomTextFormFieldOtpState();
}

class _CustomTextFormFieldOtpState extends State<CustomTextFormFieldOtp> {
  bool _isFocused = false;

  @override
  void initState() {
    widget._textFieldEntity.focusNode?.addListener(() {
      if (widget._textFieldEntity.focusNode?.hasFocus ?? false) {
        FocusScope.of(context).requestFocus(widget._textFieldEntity.focusNode);
        setState(() {
          _isFocused = true;
        });
      } else {
        setState(() {
          _isFocused = false;
        });
        widget._textFieldEntity.focusNode?.unfocus();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56,
      child: TextFormField(
        controller: widget._textFieldEntity.textController,
        keyboardType: widget._textFieldEntity.keyboardType,
        inputFormatters: widget._textFieldEntity.inputFormatters,
        style: AppTextStyle.regular.copyWith(
          fontSize: AppFontSize.medium,
          color: _isFocused ? AppColors.primary : AppColors.neutral400,
        ),
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: _isFocused ? AppColors.neutral100 : AppColors.neutral300,
          hintText: "-",
          hintStyle: AppTextStyle.regular.copyWith(
            color: AppColors.neutral300,
            fontSize: AppFontSize.medium,
          ),
          contentPadding: const EdgeInsets.all(12.0),
          focusedErrorBorder: _border(),
          enabledBorder: _border(),
          focusedBorder: const OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(AppBorderRadius.large / 2)),
            borderSide: BorderSide(
              color: AppColors.primary,
              width: 1,
            ),
          ),
          border: _border(),
          errorBorder: const OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(AppBorderRadius.large / 2)),
            borderSide: BorderSide(color: AppColors.primary, width: 2),
          ),
        ),
        textAlign: TextAlign.center,
        maxLength: 1,
        onChanged: widget._onChanged,
        focusNode: widget._textFieldEntity.focusNode,
        validator: widget._textFieldEntity.validator,
      ),
    );
  }

  InputBorder _border() {
    return const OutlineInputBorder(
      borderRadius:
          BorderRadius.all(Radius.circular(AppBorderRadius.large / 2)),
      borderSide: BorderSide(
        color: Color(0xFFF4F0ED),
        width: 2,
      ),
    );
  }
}

class CustomTextFormFieldSearch extends StatelessWidget {
  final TextEditingController _controller;
  final Function(String)? _onSubmitted;
  final Function()? _onPressed;
  final String? _hint;
  const CustomTextFormFieldSearch({
    Key? key,
    required TextEditingController controller,
    required Function(String)? onSubmitted,
    required Function()? onPressed,
    String? hint,
  })  : _controller = controller,
        _onSubmitted = onSubmitted,
        _onPressed = onPressed,
        _hint = hint,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
            prefixIcon: IconButton(
              onPressed: _onPressed,
              icon:
                  const Icon(Icons.search, color: Color(0xFFA5A3A3), size: 20),
            ),
            filled: true,
            fillColor: AppColors.neutral200,
            hintText: _hint ?? "Search",
            hintStyle: AppTextStyle.regular.copyWith(
              color: AppColors.neutral300,
            ),
            contentPadding: const EdgeInsets.all(12),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFF4F0ED), width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFF4F0ED), width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFF4F0ED), width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFF4F0ED), width: 1),
              borderRadius: BorderRadius.circular(12),
            )),
        onSubmitted: _onSubmitted,
      ),
    );
  }
}

class NewCustomTextFormFieldSearch extends StatelessWidget {
  final TextEditingController _controller;
  final Function(String)? _onSubmitted;
  final Function()? _onPressed;
  final String? _hint;
  final FocusNode? _focusNode;
  const NewCustomTextFormFieldSearch({
    Key? key,
    required TextEditingController controller,
    required Function(String)? onSubmitted,
    required Function()? onPressed,
    String? hint,
    FocusNode? focusNode,
  })  : _controller = controller,
        _onSubmitted = onSubmitted,
        _onPressed = onPressed,
        _hint = hint,
        _focusNode = focusNode,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        decoration: InputDecoration(
            prefixIcon: IconButton(
              onPressed: _onPressed,
              icon:
                  const Icon(Icons.search, color: Color(0xFFA5A3A3), size: 20),
            ),
            filled: true,
            fillColor: const Color(0xffF3F4F6),
            hintText: _hint ?? "Search",
            hintStyle: AppTextStyle.regular.copyWith(
              color: AppColors.neutral300,
            ),
            contentPadding: const EdgeInsets.all(12),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFF4F0ED), width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFF4F0ED), width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFF4F0ED), width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFF4F0ED), width: 1),
              borderRadius: BorderRadius.circular(12),
            )),
        onSubmitted: _onSubmitted,
      ),
    );
  }
}

class CustomTextFormFieldRequest extends StatefulWidget {
  const CustomTextFormFieldRequest({
    Key? key,
    required TextFieldEntity textFieldEntity,
    int maxLines = 1,
    bool isRequired = true,
    Function()? onTap,
    IconData? icon,
  })  : _textFieldEntity = textFieldEntity,
        _maxLines = maxLines,
        _onTap = onTap,
        _isRequired = isRequired,
        _icon = icon,
        super(key: key);
  final TextFieldEntity _textFieldEntity;
  final int _maxLines;
  final bool _isRequired;
  final Function()? _onTap;
  final IconData? _icon;

  @override
  State<CustomTextFormFieldRequest> createState() =>
      _CustomTextFormFieldRequestState();
}

class _CustomTextFormFieldRequestState
    extends State<CustomTextFormFieldRequest> {
  @override
  void initState() {
    widget._textFieldEntity.focusNode?.addListener(() {
      if (widget._textFieldEntity.focusNode?.hasFocus ?? false) {
      } else {
        widget._textFieldEntity.focusNode?.unfocus();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: widget._textFieldEntity.label,
            children: [
              TextSpan(
                text: widget._isRequired ? ' *' : '',
                style: AppTextStyle.semiBold.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
            style: AppTextStyle.semiBold.copyWith(
              color: const Color(0xff111111),
            ),
          ),
        ),
        const Gap(height: AppGap.small / 2),
        GestureDetector(
          onTap: widget._onTap,
          child: TextFormField(
            controller: widget._textFieldEntity.textController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: widget._textFieldEntity.textInputAction,
            enabled: widget._textFieldEntity.isEnabled,
            keyboardType: widget._textFieldEntity.keyboardType,
            inputFormatters: widget._textFieldEntity.inputFormatters,
            maxLines: widget._maxLines,
            decoration: InputDecoration(
              hintText: widget._textFieldEntity.hint,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              hintStyle: AppTextStyle.regular.copyWith(
                color: AppColors.neutral400,
              ),
              contentPadding: const EdgeInsets.all(12),
              filled: true,
              fillColor:
                  widget._textFieldEntity.isEnabled || widget._onTap != null
                      ? const Color.fromRGBO(235, 229, 222, .5)
                      : Colors.grey,
              suffixIcon: widget._icon != null
                  ? Icon(
                      widget._icon,
                      color: AppColors.primary,
                    )
                  : null,
              errorStyle: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            style: AppTextStyle.regular,
            validator: widget._textFieldEntity.validator,
          ),
        ),
      ],
    );
  }
}

class CustomTextFieldCreditCards extends StatelessWidget {
  const CustomTextFieldCreditCards({
    super.key,
    required TextEditingController textController,
    required String hint,
    bool isHaveSuffix = false,
    bool isText = false,
    int? maxLength,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
  })  : _textController = textController,
        _hint = hint,
        _isHaveSuffix = isHaveSuffix,
        _isText = isText,
        _maxLength = maxLength,
        _validator = validator,
        _onChanged = onChanged;

  final TextEditingController _textController;
  final String _hint;
  final bool _isHaveSuffix;
  final bool _isText;
  final int? _maxLength;
  final String? Function(String?)? _validator;
  final void Function(String)? _onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: TextFormField(
        controller: _textController,
        textInputAction: TextInputAction.next,
        keyboardType: _isText ? TextInputType.name : TextInputType.number,
        decoration: InputDecoration(
          hintText: _hint,
          counterText: "",
          errorText: '',
          errorStyle: const TextStyle(
            color: Colors.transparent,
            fontSize: 0,
            height: 0,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          hintStyle: AppTextStyle.regular.copyWith(color: AppColors.neutral400),
          filled: true,
          fillColor: const Color.fromRGBO(235, 229, 222, .5),
          suffixIcon: _isHaveSuffix
              ? const Icon(
                  Icons.info_rounded,
                  color: AppColors.primary,
                )
              : null,
        ),
        inputFormatters: _isText
            ? null
            : <TextInputFormatter>[
                FilteringTextInputFormatter.allow(
                  RegExp(r"([0-9])"),
                ),
              ],
        maxLength: _maxLength,
        style: AppTextStyle.regular.copyWith(color: AppColors.neutral400),
        validator: _validator,
        onChanged: _onChanged,
      ),
    );
  }
}

class CustomTextFormFieldBordered extends StatefulWidget {
  const CustomTextFormFieldBordered({
    Key? key,
    required TextFieldEntity textFieldEntity,
    int maxLines = 1,
    Color backgroundDisable = TextFieldColors.backgroundDisable,
    String? Function(String?)? validator,
    Function(String)? onChanged,
    int? maxLength,
    Widget? widgetSuffix,
    Widget? suffixIcon,
    Function()? onTap,
  })  : _textFieldEntity = textFieldEntity,
        _maxLines = maxLines,
        _backgroundDisable = backgroundDisable,
        _validator = validator,
        _onChanged = onChanged,
        _maxLength = maxLength,
        _widgetSuffix = widgetSuffix,
        _suffixIcon = suffixIcon,
        _onTap = onTap,
        super(key: key);

  final TextFieldEntity _textFieldEntity;
  final int _maxLines;
  final Color _backgroundDisable;
  final String? Function(String?)? _validator;
  final Function(String)? _onChanged;
  final int? _maxLength;
  final Widget? _widgetSuffix;
  final Widget? _suffixIcon;
  final Function()? _onTap;

  @override
  State<CustomTextFormFieldBordered> createState() =>
      _CustomTextFormFieldBorderedState();
}

class _CustomTextFormFieldBorderedState
    extends State<CustomTextFormFieldBordered> {
  bool _isObscureText = false;

  @override
  void initState() {
    _isObscureText = widget._textFieldEntity.isPassword;

    widget._textFieldEntity.focusNode?.addListener(() {
      if (widget._textFieldEntity.focusNode?.hasFocus ?? false) {
      } else {
        widget._textFieldEntity.focusNode?.unfocus();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget._textFieldEntity.label.trim().isNotEmpty,
          child: Text(
            widget._textFieldEntity.label,
            style: AppTextStyle.regular.copyWith(fontSize: 13),
          ),
        ),
        Visibility(
          visible: widget._textFieldEntity.label.trim().isNotEmpty,
          child: const Gap(height: AppGap.small / 2),
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: widget._textFieldEntity.textController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                textInputAction: widget._textFieldEntity.textInputAction,
                enabled: widget._textFieldEntity.isEnabled,
                keyboardType: widget._textFieldEntity.keyboardType,
                inputFormatters: widget._textFieldEntity.inputFormatters,
                maxLines: widget._maxLines,
                onChanged: widget._onChanged,
                onTap: widget._onTap,
                decoration: InputDecoration(
                  hintText: widget._textFieldEntity.hint,
                  counterText: "",
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE1D3C9)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE1D3C9)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE1D3C9)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE1D3C9)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE1D3C9)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  hintStyle: AppTextStyle.regular.copyWith(
                    fontSize: 13,
                    color: const Color(0xFFA5A3A3),
                  ),
                  contentPadding: const EdgeInsets.all(12),
                  filled: true,
                  fillColor: widget._textFieldEntity.isEnabled
                      ? AppColors.neutral100
                      : widget._backgroundDisable,
                  suffixIcon: widget._suffixIcon ??
                      Visibility(
                        visible: widget._textFieldEntity.isPassword,
                        child: IconButton(
                          color: AppColors.primary,
                          icon: Icon(
                            _isObscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscureText = !_isObscureText;
                            });
                          },
                        ),
                      ),
                  errorStyle: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                maxLength: widget._maxLength,
                style: AppTextStyle.regular.copyWith(
                  fontSize: 13,
                  color: AppColors.neutral400,
                ),
                obscureText: _isObscureText,
                validator:
                    widget._validator ?? widget._textFieldEntity.validator,
              ),
            ),
            widget._widgetSuffix ?? const SizedBox(),
          ],
        ),
      ],
    );
  }
}

class CustomTextFormFieldFixedFee extends StatefulWidget {
  final TextEditingController _textController;
  final String _label;
  final List<TextInputFormatter>? _inputFormatters;
  final int? _maxLines;
  final Function(String)? _onChanged;
  final Function()? _onTap;
  final String? _hint;
  final int? _maxLength;
  final String? Function(String?)? _validator;
  final double _widthLabel;
  const CustomTextFormFieldFixedFee({
    Key? key,
    required TextEditingController textController,
    required String label,
    List<TextInputFormatter>? inputFormatters,
    int? maxLines,
    Function(String)? onChanged,
    Function()? onTap,
    String? hint,
    int? maxLength,
    String? Function(String?)? validator,
    double widthLabel = 40,
  })  : _textController = textController,
        _label = label,
        _inputFormatters = inputFormatters,
        _maxLines = maxLines,
        _onChanged = onChanged,
        _onTap = onTap,
        _hint = hint,
        _maxLength = maxLength,
        _validator = validator,
        _widthLabel = widthLabel,
        super(key: key);

  @override
  State<CustomTextFormFieldFixedFee> createState() =>
      _CustomTextFormFieldFixedFeeState();
}

class _CustomTextFormFieldFixedFeeState
    extends State<CustomTextFormFieldFixedFee> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget._label.trim().isNotEmpty,
          child: Container(
            width: widget._widthLabel,
            height: 40,
            alignment: Alignment.centerLeft,
            child: Text(
              widget._label,
              style: AppTextStyle.regular.copyWith(fontSize: 13),
            ),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: widget._textController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            inputFormatters: widget._inputFormatters,
            maxLines: widget._maxLines,
            onChanged: widget._onChanged,
            onTap: widget._onTap,
            decoration: InputDecoration(
              hintText: widget._hint,
              counterText: "",
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE1D3C9)),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE1D3C9)),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE1D3C9)),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE1D3C9)),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE1D3C9)),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              hintStyle: AppTextStyle.regular.copyWith(
                fontSize: 13,
                color: const Color(0xFFA5A3A3),
              ),
              contentPadding: const EdgeInsets.all(12),
              filled: true,
              fillColor: AppColors.neutral100,
              errorStyle: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            maxLength: widget._maxLength,
            style: AppTextStyle.regular.copyWith(
              fontSize: 13,
              color: AppColors.neutral400,
            ),
            validator: widget._validator,
          ),
        ),
      ],
    );
  }
}

class CustomTextFormFieldTierUnit extends StatefulWidget {
  final TextEditingController _textController;
  final String _label;
  final List<TextInputFormatter>? _inputFormatters;
  final int? _maxLines;
  final Function(String)? _onChanged;
  final Function()? _onTap;
  final String? _hint;
  final int? _maxLength;
  final String? Function(String?)? _validator;
  final double _widthLabel;
  const CustomTextFormFieldTierUnit({
    Key? key,
    required TextEditingController textController,
    required String label,
    List<TextInputFormatter>? inputFormatters,
    int? maxLines,
    Function(String)? onChanged,
    Function()? onTap,
    String? hint,
    int? maxLength,
    String? Function(String?)? validator,
    double widthLabel = 75,
  })  : _textController = textController,
        _label = label,
        _inputFormatters = inputFormatters,
        _maxLines = maxLines,
        _onChanged = onChanged,
        _onTap = onTap,
        _hint = hint,
        _maxLength = maxLength,
        _validator = validator,
        _widthLabel = widthLabel,
        super(key: key);

  @override
  State<CustomTextFormFieldTierUnit> createState() =>
      _CustomTextFormFieldTierUnitState();
}

class _CustomTextFormFieldTierUnitState
    extends State<CustomTextFormFieldTierUnit> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget._label.trim().isNotEmpty,
          child: Container(
            width: widget._widthLabel,
            height: 40,
            alignment: Alignment.centerLeft,
            child: Text(
              widget._label,
              style: AppTextStyle.regular.copyWith(fontSize: 13),
            ),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: widget._textController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            inputFormatters: widget._inputFormatters,
            maxLines: widget._maxLines,
            onChanged: widget._onChanged,
            onTap: widget._onTap,
            decoration: InputDecoration(
              hintText: widget._hint,
              counterText: "",
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE1D3C9)),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE1D3C9)),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE1D3C9)),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE1D3C9)),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE1D3C9)),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              hintStyle: AppTextStyle.regular.copyWith(
                fontSize: 13,
                color: const Color(0xFFA5A3A3),
              ),
              contentPadding: const EdgeInsets.all(12),
              filled: true,
              fillColor: AppColors.neutral100,
              errorStyle: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            maxLength: widget._maxLength,
            style: AppTextStyle.regular.copyWith(
              fontSize: 13,
              color: AppColors.neutral400,
            ),
            validator: widget._validator,
          ),
        ),
      ],
    );
  }
}
