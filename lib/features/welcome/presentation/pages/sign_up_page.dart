import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:marketplace_eid_restructure/features/common/common.dart';
import '../../../../lib.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final List<TextFieldEntity> _signUp = TextFieldEntity.authRegister;
  final _formKey = GlobalKey<FormBuilderState>();
  String _matchedPassword = '';

  @override
  void initState() {
    for (var dt in _signUp) {
      dt.textController.text = '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.neutral100,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Register",
          style: AppTextStyle.bold.copyWith(
            color: AppColors.neutral500,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          child: ColumnPadding(
            padding: EdgeInsets.only(
              // top: ResponsiveUtils(context).getResponsivePaddingTop(),
              left: size.width * 0.05,
              right: size.width * 0.05,
            ),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hai, Selamat Bergabung!",
                style: AppTextStyle.semiBold.copyWith(
                  color: AppColors.neutral500,
                ),
              ),
              Gap(height: size.height * 0.01),
              Text(
                "Senang bisa melihatmu. Silahkan Bergabung ",
                style: AppTextStyle.regular.copyWith(
                  color: AppColors.neutral300,
                ),
              ),
              Gap(height: size.height * 0.02),
              CustomTextFormField(
                textFieldEntity: _signUp[0],
                widgetPrefix: const Icon(CupertinoIcons.person_2_alt),
              ),
              const Gap(height: 16),
              CustomTextFormField(
                textFieldEntity: _signUp[1],
                widgetPrefix: const Icon(CupertinoIcons.mail_solid),
              ),
              const Gap(height: 16),
              CustomTextFormField(
                textFieldEntity: _signUp[2],
                widgetPrefix: const Icon(CupertinoIcons.lock_shield_fill),
              ),
              const Gap(height: 16),
              CustomTextFormField(
                textFieldEntity: _signUp[3],
                widgetPrefix: const Icon(CupertinoIcons.lock_shield_fill),
                validator: (value) {
                  _matchedPassword = _signUp[2].textController.text.trim();
                  final isMatched = value?.compareTo(_matchedPassword);

                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 8) {
                    return 'Password must be at least 8 characters';
                  } else if (isMatched != 0) {
                    return "Passwords do not match";
                  }

                  return null;
                },
              ),
              SizedBox(height: size.height * 0.02),
              RoundedButton(
                text: "Daftar",
                ontap: () {},
              ),
              const Gap(height: 10),
              Center(
                child: Text(
                  "atau gunakan akun",
                  style: AppTextStyle.regular.copyWith(
                    color: AppColors.neutral500,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
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
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "sudah punya akun?",
                    style: AppTextStyle.regular.copyWith(
                      color: AppColors.neutral500,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      "Masuk",
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
    );
  }
}
