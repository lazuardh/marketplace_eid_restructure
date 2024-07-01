import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../lib.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController controller = PageController();
  int index = 0;
  final List<WelcomePageEntity> _welcomePageEntity =
      WelcomePageEntity.getWelcomePageList;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(
            child: ColumnPadding(
          crossAxisAlignment: CrossAxisAlignment.start,
          padding: EdgeInsets.symmetric(
            horizontal: ResponsiveUtils(context).getMediaQueryWidth() * 0.05,
          ),
          children: [
            const Gap(height: 16),
            const CustomSvgWrapper(
              svgPath: AppIllustrations.estimtaorImage,
              fit: BoxFit.contain,
              isNetwork: false,
            ),
            const Gap(height: 16),
            Expanded(
              flex: 6,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                children: [
                  ...List.generate(
                    _welcomePageEntity.length,
                    (index) => _WelcomePageWrapper(
                      subtitle: _welcomePageEntity[index].description,
                      image: _welcomePageEntity[index].images,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonPrimary(
                    "Skip",
                    buttonColor: AppColors.neutral100,
                    height: 38,
                    labelColor: AppColors.primary,
                    borderRadius: AppBorderRadius.small,
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        PagePath.introduction,
                      );
                    },
                  ),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const JumpingDotEffect(
                        spacing: 5,
                        dotColor: Color(0xFFBCBCBC),
                        activeDotColor: AppColors.neutral100,
                        dotWidth: 8,
                        dotHeight: 8),
                  ),
                  ButtonPrimary(
                    "Next",
                    buttonColor: AppColors.neutral100,
                    height: 38,
                    labelColor: AppColors.primary,
                    borderRadius: AppBorderRadius.small,
                    onPressed: () {
                      switch (index) {
                        case 0:
                          setState(() {
                            index++;
                          });

                          controller.animateToPage(index,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                          break;
                        case 1:
                          setState(() {
                            index++;
                          });

                          controller.animateToPage(index,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                          break;
                        case 2:
                          Navigator.pushReplacementNamed(
                            context,
                            PagePath.introduction,
                          );
                          break;
                        default:
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}

class _WelcomePageWrapper extends StatelessWidget {
  const _WelcomePageWrapper({
    Key? key,
    required this.subtitle,
    required this.image,
  }) : super(key: key);

  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          subtitle,
          style: AppTextStyle.medium.copyWith(
            color: AppColors.neutral100,
          ),
        ),
        const Gap(height: 16),
        CustomSvgWrapper(
          svgPath: image,
          width: double.infinity,
          height: ResponsiveUtils(context).getMediaQueryHeight() * 0.5,
          fit: BoxFit.contain,
          isNetwork: false,
        ),
      ],
    );
  }
}
