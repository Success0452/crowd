import 'package:crowd/pages/login/login_controller.dart';
import 'package:crowd/pages/splashscreen/splashcontroller.dart';
import 'package:crowd/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
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
        ChangeNotifierProvider(create: (context) => LoginController())
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteHelper.getOnboard(),
        getPages: RouteHelper.routes,
      ),
    );
  }
}
