import 'package:crowd/pages/login/login_screen.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String onboard = '/onboard';

  static String getOnboard() => '$onboard';

  static List<GetPage> routes = [
    GetPage(
        name: onboard,
        page: () => const LoginScreen(),
        transition: Transition.fadeIn)
  ];
}
