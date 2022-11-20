import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ApiClient extends GetConnect implements GetxService{
  late String token;
  final String baseUrl;
  late Map<String, String> _mainHeader;
  final GetStorage storage;

  ApiClient({ required this.baseUrl, required this.storage}){
    baseUrl = baseUrl;
    token = "";
    timeout = const Duration(seconds: 30);
    _mainHeader = {
      "Content_type": '' 'application/json; charset= UTF-8',
      "Authorization" : "Bearer $token"
    };
  }

  Future<Response> getData(String uri) async{
    try{
      Response response = await get(uri);
      return response;
    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }


}