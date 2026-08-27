import 'package:flutter/material.dart';
import 'package:grocery/core/router/app_routes.dart';
import 'package:grocery/feature/login/presentation/screen/login_screen.dart';
import 'package:grocery/feature/otp/presentation/screens/otp_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.otp:
        // final args = settings.arguments as OtpArguments;

        return _page(OtpScreen(/*phone: args.phone, name: args.name*/));
      //PageRouteBuilder
      //custom routing
      case AppRoutes.login:
        return _page(const LoginScreen());
      default:
        return _errorRoute(settings.name);
    }
  }

  static MaterialPageRoute _page(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }

  static MaterialPageRoute _errorRoute(String? route) {
    return MaterialPageRoute(
      builder: (_) =>
          Scaffold(body: Center(child: Text('Route "$route" not found'))),
    );
  }
}
