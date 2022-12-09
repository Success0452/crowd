import 'package:crowd/db/connect.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ReportController extends ChangeNotifier {
  var description = TextEditingController();
  var warning = TextEditingController();
  var title = TextEditingController();

  saveEmergencies() async {
    print("here");
    var now = DateTime.now();
    var formatterDate = DateFormat('dd/MM/yy');
    var formatterTime = DateFormat('kk:mm');
    String actualDate = formatterDate.format(now);
    String actualTime = formatterTime.format(now);

    // Position position = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);

    var email = GetStorage().read("email");
    print(email);
    if (email != null) {
      var user = await MongoDatabase.retriveOne("Users", {"email": email});
      await MongoDatabase.insert({
        "title": title.text,
        "time": actualTime,
        "date": actualDate,
        "user": user!['_id'],
        "location": "position",
        "description": description.text
      }, "Emergencies");

      await MongoDatabase.updateOne("Users", {"email": email}, {"point": user['point'] + 1});
      notifyUser(description.text, warning.text);
    } else {
      await MongoDatabase.insert({
        "title": title.text,
        "time": actualTime,
        "date": actualDate,
        "user": "Anonymous",
        "location": "position",
        "description": description.text
      }, "Emergencies");
    }
  }

  notifyUser(String message, String title) async {
    // implelement notifying users here
    http.Client()
        .post(
            Uri.parse("https://mynotification.onrender.com/notification"),
            body: {"message": message, "title": title})
        .then((value) => {
              Get.snackbar("info", "notification sent successfully",
                  duration: const Duration(milliseconds: 1000))
            })
        .catchError((onError) => {
              Get.snackbar("info", "unable to send notification",
                  duration: const Duration(milliseconds: 1000))
            });
  }
}
