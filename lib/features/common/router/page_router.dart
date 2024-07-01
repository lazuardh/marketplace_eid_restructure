import 'package:flutter/material.dart';
import 'package:marketplace_eid_restructure/features/welcome/presentation/pages/sign_in_page.dart';
import 'package:marketplace_eid_restructure/features/welcome/presentation/pages/sign_up_page.dart';
import 'package:marketplace_eid_restructure/features/welcome/presentation/pages/welcome_pages.dart';
import '../../../lib.dart';

class PageRouter {
  Route<dynamic>? getRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      /* onBoarding*/
      //-------------------------------------------------------

      case PagePath.onBoarding:
        return _buildRouter(
          settings: settings,
          builder: (arguments) => const WelcomePage(),
        );

      //------------------------------------------------------

      /* introduction */
      //-------------------------------------------------------
      case PagePath.introduction:
        return _buildRouter(
          settings: settings,
          builder: (arguments) => const IntroductionPage(),
        );
      //------------------------------------------------------

      /* login */
      //-------------------------------------------------------
      case PagePath.signIn:
        return _buildRouter(
          settings: settings,
          builder: (arguments) => const SignInPage(),
        );
      //------------------------------------------------------

      /* Register */
      //-------------------------------------------------------
      case PagePath.SignUp:
        return _buildRouter(
          settings: settings,
          builder: (arguments) => const SignUpPage(),
        );
      //------------------------------------------------------

      default:
        return null;
    }
  }

  Route<dynamic> _buildRouter({
    required RouteSettings settings,
    required Widget Function(Object? arguments) builder,
  }) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => builder(settings.arguments),
    );
  }
}
