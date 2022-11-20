class AddressModel{

  late int? _id;
  late String _addressType;
  late String? _contactPersonName;
  late String? _contactPersonNumber;
  late String _address;
  late String _latitude;
  late String _longitude;

  AddressModel({
    id, required addressType,
    contactPersonName, contactPersonNumber,
    address, latitude, longitude
  }){
    _id = id;
    _addressType = addressType;
    _contactPersonName = contactPersonName;
    _contactPersonNumber = contactPersonNumber;
    _address = address;
    _latitude = latitude;
    _longitude = longitude;
  }

  String get address => _address;
  String get addressType => _addressType;
  String? get contactPersonName => _contactPersonName;
  String? get contactPersonNumber => _contactPersonNumber;
  String get latitude => _latitude;
  String get longitude => _longitude;


  AddressModel.fromJson(Map<String, dynamic> json) {
    _id =  json['id'];
     _addressType = json['addressType'];
     _contactPersonName = json['contactPersonName'];
     _contactPersonNumber = json['contactPersonNumber'];
     _address = json['address'];
     _latitude = json['latitude'];
     _longitude = json['longitude'];
  }

  Map<String, dynamic> toJson(){
    var data = Map<String, dynamic>();
    data['id'] = _id;
    data['addressType'] = _addressType;
    data['contactPersonName'] = _contactPersonName;
    data['contactPersonNumber'] = _contactPersonNumber;
    data['address'] = _address;
    data['latitude'] = _latitude;
    data['longitude'] = _longitude;
    return data;
  }
}