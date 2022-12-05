import 'package:crowd/db/connect.dart';
import 'package:crowd/model/emergency_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class InfoController extends ChangeNotifier {
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
}
