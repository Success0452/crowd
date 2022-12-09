import 'package:crowd/routes/route.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends ChangeNotifier {
  // declaration of signup function/method
  initialize() async {
    // delay the splash screen for 3 seconds
    await Future.delayed(const Duration(milliseconds: 2000));
    // check whether userId is already present
    if (GetStorage().read("email") != null) {
      Get.offAllNamed(RouteHelper.getDashboard());
    } else {
      Get.offAllNamed(RouteHelper.getOnboard());
    }

    // notify the user interface
    notifyListeners();
  }
}
