import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:crowd/server/api_client.dart';
import 'package:crowd/util/constant.dart';

class LocationRepo {
  final ApiClient apiClient;
  final GetStorage storage;

  LocationRepo({required this.apiClient, required this.storage});

  Future<Response> getAddressFromGeocode(LatLng latLng) async {
    print(
        '${AppConstant.GEOCODE_URI}${latLng.latitude},${latLng.longitude}&key=${AppConstant.API_KEY}');
    return await apiClient.getData(
        '${AppConstant.GEOCODE_URI}.${latLng.latitude}.,.${latLng.longitude}.&key=.${AppConstant.API_KEY}');
  }

  String getAddressFromLocal() {
    return storage.read("address");
  }
}
