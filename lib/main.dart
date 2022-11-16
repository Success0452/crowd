import 'package:crowd/pages/dashboard/dashboardcontroller.dart';
import 'package:crowd/pages/login/login_controller.dart';
import 'package:crowd/pages/register/registercontroller.dart';
import 'package:crowd/pages/splashscreen/splashcontroller.dart';
import 'package:crowd/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:crowd/db/connect.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
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
        ChangeNotifierProvider(create: (context) => RegisterController())
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteHelper.getOnboard(),
        getPages: RouteHelper.routes,
      ),
    );
  }
}
