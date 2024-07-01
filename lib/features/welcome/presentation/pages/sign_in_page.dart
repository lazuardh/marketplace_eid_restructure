import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lottie/lottie.dart';

import '../../../../lib.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final List<TextFieldEntity> _signIn = TextFieldEntity.authLogin;

  @override
  void initState() {
    for (var dt in _signIn) {
      dt.textController.text = '';
    }
    super.initState();
  }

  @override
  void dispose() {
    for (var dt in _signIn) {
      dt.textController.dispose();
    }
    super.dispose();
  }

  // bool rememberMe = false;
  bool? rememberMe = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            child: ColumnPadding(
              padding: EdgeInsets.symmetric(horizontal: size.height * 0.05),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(height: size.height * 0.04),
                const CustomAppBar(
                  title: "Login",
                  automaticallyImplyLeading: false,
                  elevation: 0,
                ),
                Text(
                  "Hai, Selamat Datang!",
                  style: AppTextStyle.semiBold.copyWith(
                    color: AppColors.neutral500,
                  ),
                ),
                Gap(height: size.height * 0.01),
                Text(
                  "Senang melihatmu lagi. Silahkan Masuk",
                  style: AppTextStyle.regular.copyWith(
                    color: AppColors.neutral300,
                  ),
                ),
                Gap(height: size.height * 0.04),
                CustomTextFormField(
                  textFieldEntity: _signIn[0],
                  widgetPrefix: const Icon(CupertinoIcons.mail_solid),
                ),
                const Gap(
                  height: 10,
                ),
                CustomTextFormField(
                  textFieldEntity: _signIn[1],
                  widgetPrefix: const Icon(CupertinoIcons.lock_shield_fill),
                ),
                BlocProvider(
                  create: (context) => RememberMeCubit(),
                  child: BlocBuilder<RememberMeCubit, bool>(
                    builder: (context, rememberMe) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // SizedBox(
                              //   width: 30,
                              //   child: Checkbox(
                              //     materialTapTargetSize:
                              //         MaterialTapTargetSize.shrinkWrap,
                              //     value: rememberMe,
                              //     onChanged: (bool? value) {
                              //       context
                              //           .read<RememberMeCubit>()
                              //           .toggleRememberMe();
                              //     },
                              //     checkColor: AppColors.neutral100,
                              //     activeColor: AppColors.neutral300,
                              //   ),
                              // ),

                              CustomCheckbox(
                                value: rememberMe,
                                onChanged: (bool? value) {
                                  context
                                      .read<RememberMeCubit>()
                                      .toggleRememberMe();
                                },
                                size: 16.0,
                                activeColor: AppColors.neutral300,
                                checkColor: AppColors.neutral100,
                              ),
                              const Gap(width: 5),
                              Text(
                                "Remember Me",
                                style: AppTextStyle.regular.copyWith(
                                  color: AppColors.neutral300,
                                  fontSize: AppFontSize.normal,
                                ),
                              )
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Lupa Password?",
                              style: AppTextStyle.regular.copyWith(
                                color: AppColors.accentBrown500,
                                fontSize: AppFontSize.small,
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
                Gap(
                  height: size.height * 0.13,
                ),
                ButtonPrimary(
                  "Masuk",
                  width: double.infinity,
                  height: 50,
                  borderRadius: AppBorderRadius.normal,
                  onPressed: () {
                    _formKey.currentState!.save();
                  },
                ),
                Gap(height: size.height * 0.02),
                Center(
                  child: Text(
                    "atau gunakan akun",
                    style: AppTextStyle.regular.copyWith(
                      color: AppColors.neutral300,
                    ),
                  ),
                ),
                Gap(
                  height: size.height * 0.02,
                ),
                ButtonWithCenterIcon(
                  'Google',
                  icon: 'assets/illustrations/google.svg',
                  width: double.infinity,
                  // height: 50,
                  buttonColor: Colors.transparent,
                  labelColor: AppColors.neutral400,
                  borderRadius: AppBorderRadius.normal,
                  borderColor: AppColors.primary,
                  elevation: 0,
                  borderWidth: 2,
                  isIconSvg: true,
                  onPressed: () {},
                ),
                const Gap(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "belum punya akun?",
                      style: AppTextStyle.regular.copyWith(
                        color: AppColors.neutral300,
                      ),
                    ),
                    const Gap(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.pushReplacementNamed(
                        //     context, RouteName.register);
                      },
                      child: Text(
                        "Daftar",
                        style: AppTextStyle.regular.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  SnackBar snackbarAlert(Size size, int condition) {
    late String message;
    late String image;

    switch (condition) {
      case 1:
        message = "Berhasil masuk!";
        image = "assets/lotie/success_primary.json";
        break;
      case 2:
        message = "Input yang anda masukkan tidak lengkap!";
        image = "assets/lotie/error.json";
        break;
      case 3:
        message = "Aktivitas masuk gagal, akun tidak ditemukan";
        image = "assets/lotie/error.json";
        break;
      default:
    }

    return SnackBar(
        duration: const Duration(seconds: 1),
        margin: EdgeInsets.only(
            bottom: size.height * 0.5,
            left: size.width * 0.2,
            right: size.width * 0.2),
        backgroundColor: AppColors.neutral100,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        behavior: SnackBarBehavior.floating,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LottieBuilder.asset(image, width: 80, height: 80),
            Text(
              message,
              // style: text3(neutral500, regular),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
