import 'package:crowd/model/user_model.dart';
import 'package:flutter/widgets.dart';
import 'package:crowd/db/connect.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends ChangeNotifier {
  String? email;
  String? name;
  String? phone;

  retriveProfile() async {
    var email = GetStorage().read("email");
    if (email != null) {
      var user = await MongoDatabase.retriveOne("Users", {email: email});
      if (user != null) {
        email = user['email'];
        name = user['name'];
        phone = user['phone'];
      }
    }
  }
}
