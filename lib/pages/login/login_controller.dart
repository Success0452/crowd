import 'package:crowd/routes/route.dart';
import 'package:flutter/widgets.dart';
import 'package:crowd/db/connect.dart';
import 'package:crowd/model/user_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends ChangeNotifier {
  var email = TextEditingController();
  var password = TextEditingController();

// make sure user is present in the db
  loginAccount() async {
    // ensure the textInputs are not empty
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      // invoke the function to retrieve user details
      var check = await MongoDatabase.retriveOne("Users", {email: email.text});
      // check whether any info was received
      if (check != null) {
        // save user email and password
        GetStorage().write("email", email);
        GetStorage().write("password", password);

        // notify user on the status of request
        Get.snackbar("info", "login success",
            duration: const Duration(milliseconds: 500));
      } else {
        // notify user on the status of request
        Get.snackbar("info", "user not available, try creating account",
            duration: const Duration(milliseconds: 500));
      }
    } else {
      // notify user on the status of request
      Get.snackbar("info", "all parameters are required",
          duration: const Duration(milliseconds: 500));
    }
  }

  logout() async {
    GetStorage().remove("email");
    GetStorage().remove("password");

    Future.delayed(const Duration(microseconds: 2000));

    Get.offAllNamed(RouteHelper.getOnboard());
  }
}
