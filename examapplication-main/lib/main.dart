import 'package:flutter/material.dart';
import 'app_route.dart';
import 'homepage.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';


void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      //routeInformationParser: AppRoute().router.routeInformationParser,
      //routerDelegate: AppRoute().router.routerDelegate,
      routerConfig: router,
    );
  }
}
