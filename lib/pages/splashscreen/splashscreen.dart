import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crowd/pages/splashscreen/splashcontroller.dart';
import 'package:crowd/util/dimensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<SplashController>().initialize();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "CrowdSourcing",
                style:
                    TextStyle(fontSize: Dimensions.font26, color: Colors.blue),
              )
            ],
          )
        ],
      ),
    );
  }
}
