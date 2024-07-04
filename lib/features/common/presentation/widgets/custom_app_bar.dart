import 'package:flutter/material.dart';

import '../../../../lib.dart';

class CustomAppBar extends StatelessWidget {
  final String _title;
  final String _subtitle;
  final bool _automaticallyImplyLeading;
  final Function()? _onPressedBack;
  final Function()? _onTapShare;
  final double _elevation;
  const CustomAppBar({
    Key? key,
    required String title,
    String subtitle = '',
    bool automaticallyImplyLeading = true,
    Function()? onPressedBack,
    Function()? onTapShare,
    double elevation = .5,
  })  : _title = title,
        _subtitle = subtitle,
        _automaticallyImplyLeading = automaticallyImplyLeading,
        _onPressedBack = onPressedBack,
        _onTapShare = onTapShare,
        _elevation = elevation,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: AppColors.neutral400,
      elevation: _elevation,
      centerTitle: true,
      titleSpacing: 0,
      automaticallyImplyLeading: _automaticallyImplyLeading,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _title,
            maxLines: 2,
            style: AppTextStyle.bold.copyWith(
              fontSize: AppFontSize.large,
              color: AppColors.neutral500,
            ),
          ),
          const Gap(height: AppGap.small),
          Text(
            _subtitle,
            maxLines: 2,
            style: AppTextStyle.regular.copyWith(
              fontSize: AppFontSize.medium,
              color: AppColors.neutral300,
            ),
          ),
        ],
      ),
      leading: _onPressedBack != null
          ? Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: _onPressedBack,
                  tooltip: "Back",
                );
              },
            )
          : null,
      actions: [
        Visibility(
          visible: _onTapShare != null,
          child: GestureDetector(
            onTap: _onTapShare,
            child: Container(
              width: 20,
              height: 20,
              margin: const EdgeInsets.only(right: AppGap.medium),
              child: const Icon(Icons.share),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomAppBarProfile extends StatelessWidget {
  final String _title;
  final bool _centerTitle;
  final bool _automaticallyImplyLeading;
  final Function()? _onPressedBack;
  final Function()? _onTapShare;
  final double _elevation;
  const CustomAppBarProfile({
    Key? key,
    required String title,
    String subtitle = '',
    bool automaticallyImplyLeading = true,
    bool centerTitle = false,
    Function()? onPressedBack,
    Function()? onTapShare,
    double elevation = .5,
  })  : _title = title,
        _centerTitle = centerTitle,
        _automaticallyImplyLeading = automaticallyImplyLeading,
        _onPressedBack = onPressedBack,
        _onTapShare = onTapShare,
        _elevation = elevation,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: AppColors.neutral400,
      elevation: _elevation,
      centerTitle: _centerTitle,
      titleSpacing: 0,
      automaticallyImplyLeading: _automaticallyImplyLeading,
      title: Text(
        _title,
        maxLines: 2,
        style: AppTextStyle.regular.copyWith(
          fontSize: AppFontSize.big,
          color: AppColors.neutral400,
        ),
      ),
      leading: _onPressedBack != null
          ? Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: _onPressedBack,
                  tooltip: "Back",
                );
              },
            )
          : null,
      actions: [
        Visibility(
          visible: _onTapShare != null,
          child: GestureDetector(
            onTap: _onTapShare,
            child: Container(
              width: 20,
              height: 20,
              margin: const EdgeInsets.only(right: AppGap.medium),
              child: const Icon(Icons.share),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomAppBarPrimaryWithSeach extends StatelessWidget {
  final TextEditingController _controller;
  final String _hint;
  final double? _height;
  final Function(String)? _onSubmitted;
  final Function()? _onPressed;

  const CustomAppBarPrimaryWithSeach({
    Key? key,
    required TextEditingController controller,
    double? height,
    required String hint,
    required final Function(String)? onSubmitted,
    required Function()? onPressed,
  })  : _controller = controller,
        _hint = hint,
        _height = height,
        _onSubmitted = onSubmitted,
        _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: _height ?? MediaQuery.of(context).size.height * 0.1,
          color: AppColors.primary,
        ),
        Positioned(
          top: 0,
          right: 0,
          child: ClipPath(
            clipper: CustomHeaderClipper(),
            child: Container(
              height: _height ?? MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.45,
              color: AppColors.primary800,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: SizedBox(
            height: 56,
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                    onPressed: _onPressed,
                    icon: const Icon(Icons.search,
                        color: Color(0xFFA5A3A3), size: 20),
                  ),
                  filled: true,
                  fillColor: AppColors.neutral100,
                  hintText: _hint ?? "Search",
                  hintStyle: AppTextStyle.regular.copyWith(
                    color: AppColors.neutral300,
                  ),
                  contentPadding: const EdgeInsets.all(12),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xFFF4F0ED), width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xFFF4F0ED), width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xFFF4F0ED), width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xFFF4F0ED), width: 1),
                    borderRadius: BorderRadius.circular(12),
                  )),
              onSubmitted: _onSubmitted,
            ),
          ),
        ),
      ],
    );
  }
}
