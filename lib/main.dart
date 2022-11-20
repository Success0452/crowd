import 'package:crowd/pages/dashboard/dashboardcontroller.dart';
import 'package:crowd/pages/info/infocontroller.dart';
import 'package:crowd/pages/login/login_controller.dart';
import 'package:crowd/pages/profile/profilecontroller.dart';
import 'package:crowd/pages/register/registercontroller.dart';
import 'package:crowd/pages/reporting/reportcontroller.dart';
import 'package:crowd/pages/splashscreen/splashcontroller.dart';
import 'package:crowd/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:crowd/db/connect.dart';
import 'package:geolocator/geolocator.dart';
import 'helper/dependencies.dart' as dependency;

void main() async {
  bool serviceEnabled;
  LocationPermission permission;

  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  await GetStorage.init();
  await dependency.init();

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    permission = await Geolocator.requestPermission();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SplashController()),
        ChangeNotifierProvider(create: (context) => LoginController()),
        ChangeNotifierProvider(create: (context) => DashboardController()),
        ChangeNotifierProvider(create: (context) => RegisterController()),
        ChangeNotifierProvider(create: (context) => ProfileController()),
        ChangeNotifierProvider(create: (context) => ReportController()),
        ChangeNotifierProvider(create: (context) => InfoController())
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteHelper.getInitial(),
        getPages: RouteHelper.routes,
      ),
    );
  }
}
