import 'package:crowd/db/connect.dart';
import 'package:crowd/model/emergency_model.dart';
import 'package:crowd/routes/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InfoController extends ChangeNotifier {
  var loadstate = ValueNotifier(false);
  Future<List<Map<String, dynamic>>?> allEmergencies() async {
    // get all the emergiencies
    var emergency = await MongoDatabase.retrieveAll("Emergencies");
    print(emergency);
    return emergency;
  }

  Future<List<Map<String, dynamic>>?> customizeEmergency(String date) async {
    // get specific emergency based on date filter
    var emergency =
        await MongoDatabase.retrieveMany("Emergencies", {date: date});
    print(emergency);
    return emergency;
  }

  logout () async{
    loadstate.value = true;
    await Future.delayed(const Duration(milliseconds: 1500));
    GetStorage().remove("email");
    GetStorage().remove("password");
    Get.offAllNamed(RouteHelper.getOnboard());
    loadstate.value = false;
  }
}
