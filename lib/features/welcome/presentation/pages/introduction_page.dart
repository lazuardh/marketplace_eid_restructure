import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../lib.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ColumnPadding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          children: [
            Gap(
              height: ResponsiveUtils(context).getMediaQueryHeight() * 0.06,
            ),
            SvgPicture.asset(
              "assets/illustrations/estimator_green.svg",
              width: 100,
            ),
            const Spacer(),
            const CustomSvgWrapper(
              svgPath: "assets/illustrations/welcome.svg",
              isNetwork: false,
            ),
            const Spacer(),
            Text(
              "Kerja Hemat",
              style: AppTextStyle.bold.copyWith(color: AppColors.primary),
            ),
            Text(
              "Hasil Akurat!",
              style: AppTextStyle.bold.copyWith(color: AppColors.primary),
            ),
            const Spacer(),
            Text(
              "aplikasi pembuatan RAB online dengan dukungan database harga terbaru yang diperbaharui secara realtime dan dapat digunakan untuk berkolaborasi dari mana saja",
              style: AppTextStyle.regular.copyWith(
                color: AppColors.neutral500,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ButtonPrimary(
              'Login',
              width: double.infinity,
              borderRadius: AppBorderRadius.normal,
              onPressed: () => Navigator.pushNamed(context, PagePath.signIn),
            ),
            Gap(
              height: ResponsiveUtils(context).getMediaQueryHeight() * 0.02,
            ),
            ButtonPrimary(
              'Register',
              width: double.infinity,
              borderRadius: AppBorderRadius.normal,
              labelColor: AppColors.primary,
              buttonColor: AppColors.neutral100,
              borderColor: AppColors.primary,
              onPressed: () => Navigator.pushNamed(context, PagePath.signUp),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton({Key? key, required this.text, required this.ontap})
      : super(key: key);
  final String text;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            color: AppColors.primary,
            border: Border.all(color: AppColors.primary, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.neutral100,
              fontSize: 14,
              // fontWeight: semibold,
            ),
          ),
        ),
      ),
    );
  }
}
