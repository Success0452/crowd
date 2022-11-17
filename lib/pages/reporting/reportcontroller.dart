import 'package:crowd/db/connect.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class ReportController extends ChangeNotifier {
  var description = TextEditingController();

  saveEmergencies() async {
    if (description.text.isEmpty) {
      // notify user on the status of request
      return Get.snackbar("info", "all parameters are required",
          duration: const Duration(milliseconds: 500));
    }

    var now = DateTime.now();
    var formatterDate = DateFormat('dd/MM/yy');
    var formatterTime = DateFormat('kk:mm');
    String actualDate = formatterDate.format(now);
    String actualTime = formatterTime.format(now);
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    var email = GetStorage().read("email");
    if (email != null) {
      var user = await MongoDatabase.retriveOne("Users", {email: email});
      print(user);
      await MongoDatabase.insert({
        "time": actualTime,
        "date": actualDate,
        "user": user!['_id'],
        "location": position,
        "description": description.text
      }, "Emergencies");

      await MongoDatabase.updateOne(
          "Users", {email: email}, {"point": user['point'] + 1});
    } else {
      await MongoDatabase.insert({
        "time": actualTime,
        "date": actualDate,
        "user": "Anonymous",
        "location": position,
        "description": description.text
      }, "Emergencies");
    }
  }
}
