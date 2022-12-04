import 'dart:ui';

import 'package:crowd/widget/button_widget.dart';
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

  CameraPosition _cameraPosition =
      const CameraPosition(target: LatLng(45.51563, -122.677433), zoom: 17);
  late LatLng _initialPosition = const LatLng(45.51563, -122.677433);

  @override
  void initState() {
    super.initState();
    getLocation();
    print(_position);
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
      backgroundColor: Colors.white,
      body: GetBuilder<LocationController>(
        builder: (locationController) {
          _address.text = '${locationController.placeMark.name ?? ''} '
              '${locationController.placeMark.locality ?? ''}'
              '${locationController.placeMark.postalCode ?? ''}'
              '${locationController.placeMark.country ?? ''}';
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Hello Mojisola",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "You are logged in",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.20,
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
                              _cameraPosition, true);
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
