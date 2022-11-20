import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:crowd/pages/dashboard/model/location_controller.dart';
import 'package:crowd/pages/dashboard/model/location_repo.dart';
import 'package:crowd/server/api_client.dart';

Future<void> init() async {
  Get.lazyPut(() => GetStorage());

  //api client
  Get.lazyPut(() => ApiClient(baseUrl: "", storage: Get.find()));

  // repositories
  Get.lazyPut(() => LocationRepo(apiClient: Get.find(), storage: Get.find()));

  // controllers
  Get.lazyPut(() => LocationController(locationRepo: Get.find()));
}
