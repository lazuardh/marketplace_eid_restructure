import 'package:flutter/material.dart';
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
      case PagePath.signUp:
        return _buildRouter(
          settings: settings,
          builder: (arguments) => const SignUpPage(),
        );
      //------------------------------------------------------

      /* Navigation */
      //-------------------------------------------------------
      case PagePath.navigation:
        return _buildRouter(
          settings: settings,
          builder: (arguments) => const BottomNavigation(),
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
