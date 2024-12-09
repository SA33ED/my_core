import 'package:flutter/material.dart';

class Routes {
  static const String initialRoute = "/";
  static const String signIn = "/sign-in";
  static const String signUp = "/sign-up";
  static const String homeScreen = "/home-screen";
  static const String forgotPassword = "/forgot-password";
  static const String forgotPasswordOtp = "/forgot-password-Otp";
  static const String otp = "/otp";
  static const String resetPassword = "/reset-password";
  static const String termsAndConditions = "/terms-and-conditions";
}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // //!Splash Screen
      // case (Routes.initialRoute):
      //   return MaterialPageRoute(
      //     builder: (_) => const SplashScreen(),
      //   );
      // //!Sign in Screen
      // case (Routes.signIn):
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => SignInCubit(sl<SignInRepo>()),
      //       child: const SignInScreen(),
      //     ),
      //   );
      // //!Sign up Screen
      // case (Routes.signUp):
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => SignUpCubit(sl<SignUpRepo>()),
      //       child: const SignUpScreen(),
      //     ),
      //   );
      // //! Forgot Password Screen
      // case (Routes.forgotPassword):
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => ForgotPasswordCubit(sl<ForgotPasswordRepo>()),
      //       child: const ForgotPasswordScreen(),
      //     ),
      //   );
      // //! Forgot Password Otp Screen
      // case (Routes.forgotPasswordOtp):
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => ForgotPasswordCubit(sl<ForgotPasswordRepo>()),
      //       child: const ForgotPasswordOtpScreen(),
      //     ),
      //   );
      // // //! Reset Password Password Screen
      // case (Routes.resetPassword):
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => ForgotPasswordCubit(sl<ForgotPasswordRepo>()),
      //       child: const ResetPasswordScreen(),
      //     ),
      //   );
      // //! OTP Password Screen
      // case (Routes.otp):
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => SignUpCubit(sl<SignUpRepo>()),
      //       child: const OtpScreen(),
      //     ),
      //   );
      // //!Home Screen
      // case (Routes.homeScreen):
      //   return MaterialPageRoute(
      //     builder: (_) => const HomeScreen(),
      //   );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('No Found Route'),
            ),
          ),
        );
    }
  }
}
