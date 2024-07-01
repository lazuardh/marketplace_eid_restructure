import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../lib.dart';

class Marketplace {
  ThemeData of(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.neutral100,
      shadowColor: AppColors.primary,
      disabledColor: AppColors.neutral300,
      // textSelectionTheme: theme.textSelectionTheme.copyWith(
      //   cursorColor: Blue.primary,
      //   selectionHandleColor: Blue.primary,
      //   selectionColor: Blue.quaternary,
      // ),
      colorScheme: theme.colorScheme.copyWith(
        primary: AppColors.primary,
        secondary: AppColors.neutral100,
        error: AppColors.accentOrange500,
      ),
      iconTheme: theme.iconTheme.copyWith(
        color: AppColors.neutral500,
      ),
      floatingActionButtonTheme: theme.floatingActionButtonTheme.copyWith(
        backgroundColor: AppColors.accentGreen500,
      ),
      appBarTheme: theme.appBarTheme.copyWith(
        backgroundColor: AppColors.accentOrange500,
        titleSpacing: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        centerTitle: true,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      cardTheme: theme.cardTheme.copyWith(
        shadowColor: AppColors.neutral500,
        elevation: 1,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppBorderRadius.small / 2,
          ),
        ),
      ),
      tabBarTheme: theme.tabBarTheme.copyWith(
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(
            color: AppColors.neutral500,
            width: 4,
          ),
        ),
      ),

      bottomNavigationBarTheme: theme.bottomNavigationBarTheme.copyWith(
        type: BottomNavigationBarType.fixed,
      ),
      dividerTheme: theme.dividerTheme.copyWith(
        color: AppColors.neutral500.withOpacity(0.3),
      ),
      inputDecorationTheme: theme.inputDecorationTheme.copyWith(
        filled: true,
        fillColor: AppColors.neutral500,
        isDense: true,
        hintStyle: AppTextStyle.regular.copyWith(
          fontSize: AppFontSize.small,
          color: AppColors.neutral500,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: AppGap.normal,
          horizontal: AppGap.normal,
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppBorderRadius.small / 2),
          ),
          borderSide: BorderSide(
            color: TextFieldColors.enabledBorder,
          ),
        ),
        // enabledBorder: const OutlineInputBorder(
        //   borderRadius: BorderRadius.all(
        //     Radius.circular(AppBorderRadius.small / 2),
        //   ),
        //   borderSide: BorderSide(
        //     color: TextFieldColors.enabledBorder,
        //   ),
        // ),
        // focusedBorder: const OutlineInputBorder(
        //   borderRadius: BorderRadius.all(
        //     Radius.circular(AppBorderRadius.small / 2),
        //   ),
        //   borderSide: BorderSide(
        //     color: TextFieldColors.focusedBorder,
        //   ),
        // ),
        // focusedErrorBorder: const OutlineInputBorder(
        //   borderRadius: BorderRadius.all(
        //     Radius.circular(AppBorderRadius.small / 2),
        //   ),
        //   borderSide: BorderSide(
        //     color: TextFieldColors.errorBorder,
        //   ),
        // ),
        // errorBorder: const OutlineInputBorder(
        //   borderRadius: BorderRadius.all(
        //     Radius.circular(AppBorderRadius.small / 2),
        //   ),
        //   borderSide: BorderSide(
        //     color: TextFieldColors.errorBorder,
        //   ),
        // ),
      ),
      splashColor: (kIsWeb || Platform.isAndroid)
          ? AppColors.neutral500.withOpacity(0.1)
          : Colors.transparent,
      highlightColor: (!kIsWeb && Platform.isAndroid)
          ? Colors.transparent
          : AppColors.neutral500.withOpacity(0.1),
      textTheme: theme.textTheme.copyWith().apply(
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
    );
  }
}
