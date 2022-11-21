import 'package:flutter/widgets.dart';
import 'package:crowd/db/connect.dart';
import 'package:get/get.dart';

class RegisterController extends ChangeNotifier {
  var name = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();

  // create user account
  createAccount() async {
    // ensure the textInputs are not empty
    if (name.text.isNotEmpty &&
        email.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        password.text.isNotEmpty &&
        confirmPassword.text.isNotEmpty) {
      // invoke the function to save user details
      if (password.text != confirmPassword.text) {
        return Get.snackbar("info", "password does not match",
            duration: const Duration(milliseconds: 1000));
      }
      var check =
          await MongoDatabase.retriveOne("Users", {"email": email.text});
      // check whether any info was received
      if (check == null) {
        await MongoDatabase.insert({
          "name": name.text,
          "email": email.text,
          "phone": phone.text,
          "password": password.text,
          "point": 0
        }, "Users");
        reset();
        Get.snackbar("info", "registration successful, you can now login",
            duration: const Duration(milliseconds: 1000));
      } else {
        // notify user on the status of request
        Get.snackbar("info", "email already a user",
            duration: const Duration(milliseconds: 1000));
      }
    } else {
      // notify user on the status of request
      Get.snackbar("info", "all parameters are required",
          duration: const Duration(milliseconds: 1000));
    }
  }

  reset() {
    name.text = '';
    email.text = '';
    phone.text = '';
    password.text = '';
    confirmPassword.text = '';
  }
}
