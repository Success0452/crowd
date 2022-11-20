import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'location_repo.dart';
import 'address_model.dart';

class LocationController extends GetxController implements GetxService {
  LocationRepo locationRepo;
  LocationController({required this.locationRepo});

  // private setter variables

  // track position of the map
  late Position _position;
  // pick tracked position of the map
  late Position _pickPosition;

  // placeMark to update location
  Placemark _placeMark = Placemark();
  // update picked location
  Placemark _pickPlaceMark = Placemark();

  // addressModel list to store list of addresses
  List<AddressModel> _addressList = [];

  // addressModel list to store all addresses
  late List<AddressModel> _allAddressList;

  // const type of address present
  List<String> _addressTypeList = ['home', 'office', 'others'];
  // index to pick particular address type
  int _addressTypeIndex = 0;

  // real database demo
  Map<String, String>? _getAddressList;
  // google controller
  late GoogleMapController _mapGoogleController;

  // boolean varibles
  bool updateAddressData = true;
  bool _changeAddress = true;
  bool _loading = false;

  // getter variables for UI
  List<AddressModel> get addressList => _addressList;
  Position get position => _position;
  Position get pickPosition => _pickPosition;
  bool get loading => _loading;
  Map? get getAddressList => _getAddressList;
  Placemark get placeMark => _placeMark;
  Placemark get pickPlaceMark => _pickPlaceMark;

  void setGoogleController(GoogleMapController mapGoogleController) {
    _mapGoogleController = mapGoogleController;
  }

  void updatePosition(CameraPosition cameraPosition, bool value) async {
    if (updateAddressData) {
      _loading = true;
      update();
      try {
        if (value) {
          _position = Position(
              longitude: cameraPosition.target.longitude,
              latitude: cameraPosition.target.latitude,
              timestamp: DateTime.now(),
              accuracy: 1,
              altitude: 1,
              heading: 1,
              speed: 1,
              speedAccuracy: 1);
        } else {
          _pickPosition = Position(
              longitude: cameraPosition.target.longitude,
              latitude: cameraPosition.target.latitude,
              timestamp: DateTime.now(),
              accuracy: 1,
              altitude: 1,
              heading: 1,
              speed: 1,
              speedAccuracy: 1);
        }
        if (_changeAddress) {
          String _address = await getAddressFromGeocode(LatLng(
              cameraPosition.target.latitude, cameraPosition.target.longitude));
          value
              ? _placeMark = Placemark(name: _address)
              : _pickPlaceMark = Placemark(name: _address);
        }
      } catch (e) {
        print(e);
      }
    }
  }

  Future<String> getAddressFromGeocode(LatLng latLng) async {
    String _address = "Unknown Location Found";
    Response response = await locationRepo.getAddressFromGeocode(latLng);
    if (response.body['status'] == "OK") {
      print(response.body);
      _address = response.body['result'][0]['formatted_address'].toString();
    } else {
      print("error getting the google api");
    }
    return _address;
  }

  void updateUiAddress() {}
}
