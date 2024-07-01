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
