import 'package:crowd/pages/dashboard/dashboard_screen.dart';
import 'package:crowd/pages/info/info_screen.dart';
import 'package:crowd/pages/login/login_screen.dart';
import 'package:crowd/pages/onboard/onboard_screen.dart';
import 'package:crowd/pages/profile/profile_screen.dart';
import 'package:crowd/pages/register/register_screen.dart';
import 'package:crowd/pages/reporting/report_screen.dart';
import 'package:crowd/pages/source.dart';
import 'package:crowd/pages/splashscreen/splashscreen.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = '/';
  static const String onboard = '/onboard';
  static const String dashboard = '/dashboard';
  static const String register = '/register';
  static const String login = '/login';
  static const String profile = '/profile';
  static const String info = '/info';
  static const String report = '/report';

  static String getOnboard() => '$onboard';
  static String getInitial() => '$initial';
  static String getDashboard() => '$dashboard';
  static String getRegister() => '$register';
  static String getLogin() => '$login';
  static String getProfile() => '$profile';
  static String getInfo() => '$info';
  static String getReport() => '$report';

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
        page: () => const Source(),
        transition: Transition.fadeIn),
    GetPage(
        name: login,
        page: () => const LoginScreen(),
        transition: Transition.fade),
    GetPage(
        name: register,
        page: () => const RegisterScreen(),
        transition: Transition.fade),
    GetPage(
        name: profile,
        page: () => const ProfileScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: info,
        page: () => const InfoScreen(),
        transition: Transition.fade),
    GetPage(
        name: report,
        page: () => const ReportScreen(),
        transition: Transition.fade)
  ];
}
