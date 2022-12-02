import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crowd/util/dimensions.dart';
import 'package:crowd/widget/textfield_widget.dart';
import 'package:crowd/widget/big_text.dart';
import 'package:geolocator/geolocator.dart';
import 'package:crowd/pages/dashboard/model/location_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var _address = TextEditingController();
  final _contactPersonName = TextEditingController();
  final _contactPersonNumber = TextEditingController();
  bool? isLoggedIn;
  LatLng? _position;
  CameraPosition? _cameraPosition;

  getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double lat = position.latitude;
    double long = position.longitude;

    LatLng location = LatLng(lat, long);

    setState(() {
      _position = location;
    });
  }

  late LatLng _initialPosition = _position!;

  @override
  void initState() {
    super.initState();
    getLocation();
    if (Get.find<LocationController>().addressList.isNotEmpty) {
      _cameraPosition = CameraPosition(target: _position!, zoom: 17);
      _cameraPosition = CameraPosition(
          target: LatLng(
              double.parse(
                  Get.find<LocationController>().getAddressList!['latitude']),
              double.parse(Get.find<LocationController>()
                  .getAddressList!['longitude'])));
      _initialPosition = LatLng(
          double.parse(
              Get.find<LocationController>().getAddressList!['latitude']),
          double.parse(
              Get.find<LocationController>().getAddressList!['longitude']));
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: GetBuilder<LocationController>(
        builder: (locationController) {
          _address.text = '${locationController.placeMark.name ?? ''} '
              '${locationController.placeMark.locality ?? ''}'
              '${locationController.placeMark.postalCode ?? ''}'
              '${locationController.placeMark.country ?? ''}';
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 0, color: Colors.transparent)),
                  child: Stack(
                    children: [
                      GoogleMap(
                        initialCameraPosition:
                            CameraPosition(target: _initialPosition, zoom: 17),
                        zoomControlsEnabled: false,
                        compassEnabled: false,
                        indoorViewEnabled: true,
                        mapToolbarEnabled: false,
                        onCameraMove: ((position) =>
                            _cameraPosition = position),
                        onMapCreated: (GoogleMapController mapController) {
                          locationController.setGoogleController(mapController);
                        },
                        onCameraIdle: () {
                          locationController.updatePosition(
                              _cameraPosition!, true);
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
