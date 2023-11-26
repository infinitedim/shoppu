import 'package:flutter/widgets.dart';
import 'package:shoppu/screens/cart_screen.dart';
import 'package:shoppu/screens/complete_profile_screen.dart';
import 'package:shoppu/screens/details_screen.dart';
import 'package:shoppu/screens/forgot_password_screen.dart';
import 'package:shoppu/screens/home_screen.dart';
import 'package:shoppu/screens/login_success_screen.dart';
import 'package:shoppu/screens/profile_screen.dart';
import 'package:shoppu/screens/sign_in_screen.dart';
import 'package:shoppu/screens/splash_screen.dart';
import 'package:shoppu/screens/sign_up_screen.dart';

String splash = "/splash";
String loginSuccess = "/login/success";
String login = "/login";
String register = "/register";
String profile = "/profile";
String completeProfile = "/profile/complete";
String home = "/";
String otp = "verify/otp";
String forgotPassword = "/password/forgot";
String details = "/products/details";
String cart = "/cart";

final Map<String, WidgetBuilder> routes = {
  splash: (context) => const SplashScreen(),
  login: (context) => const SignInScreen(),
  forgotPassword: (context) => const ForgotPasswordScreen(),
  loginSuccess: (context) => const LoginSuccessScreen(),
  register: (context) => const SignUpScreen(),
  completeProfile: (context) => const CompleteProfileScreen(),
  home: (context) => const HomeScreen(),
  details: (context) => const DetailsScreen(),
  cart: (context) => const CartScreen(),
  profile: (context) => const ProfileScreen(),
};
