import 'package:crowd/routes/route.dart';
import 'package:flutter/widgets.dart';
import 'package:crowd/db/connect.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends ChangeNotifier {
  var loadstate = ValueNotifier(false);
  // connect login details
  var email = TextEditingController();
  var password = TextEditingController();

// make sure user is present in the db
  loginAccount() async {
    // ensure the textInputs are not empty
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      loadstate.value = true;
      // invoke the function to retrieve user details
      var check = await MongoDatabase.retriveOne(
          "Users", {"email": email.text, "password": password.text});
      // check whether any info was received
      if (check != null) {
        // save user email and password
        GetStorage().write("email", email.text);
        GetStorage().write("password", password.text);

        Get.offAllNamed(RouteHelper.getDashboard());
        // notify user on the status of request
        Get.snackbar("info", "login success",
            duration: const Duration(milliseconds: 1000));
        loadstate.value = false;
      } else {
        // notify user on the status of request
        Get.snackbar("info", "email or password is incorrect",
            duration: const Duration(milliseconds: 1000));
        loadstate.value = false;
      }
    } else {
      // notify user on the status of request
      Get.snackbar("info", "all parameters are required",
          duration: const Duration(milliseconds: 1000));
      loadstate.value = false;
    }
  }

  logout() async {
    loadstate.value = true;
    GetStorage().remove("email");
    GetStorage().remove("password");

    Future.delayed(const Duration(microseconds: 2000));

    Get.offAllNamed(RouteHelper.getOnboard());
    loadstate.value = false;
  }
}
