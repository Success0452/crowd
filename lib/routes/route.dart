import 'package:crowd/pages/dashboard/dashboard_screen.dart';
import 'package:crowd/pages/login/login_screen.dart';
import 'package:crowd/pages/onboard/onboard_screen.dart';
import 'package:crowd/pages/register/register_screen.dart';
import 'package:crowd/pages/splashscreen/splashscreen.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = '/';
  static const String onboard = '/onboard';
  static const String dashboard = '/dashboard';
  static const String register = '/register';
  static const String login = '/login';

  static String getOnboard() => '$onboard';
  static String getInitial() => '$initial';
  static String getDashboard() => '$dashboard';
  static String getRegister() => '$register';
  static String getLogin() => '$login';

  static List<GetPage> routes = [
    GetPage(
        name: onboard,
        page: () => const OnboardScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: initial,
        page: () => const SplashScreen(),
        transition: Transition.fade),
    GetPage(
        name: dashboard,
        page: () => const DashboardScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: login,
        page: () => const LoginScreen(),
        transition: Transition.fade),
    GetPage(
        name: register,
        page: () => const RegisterScreen(),
        transition: Transition.fade),
  ];
}
