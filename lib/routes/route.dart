import 'package:crowd/pages/login/login_screen.dart';
import 'package:crowd/pages/splashscreen/splashscreen.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = '/';
  static const String onboard = '/onboard';

  static String getOnboard() => '$onboard';
  static String getInitial() => '$initial';

  static List<GetPage> routes = [
    GetPage(
        name: onboard,
        page: () => const LoginScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: initial,
        page: () => const SplashScreen(),
        transition: Transition.fade)
  ];
}
