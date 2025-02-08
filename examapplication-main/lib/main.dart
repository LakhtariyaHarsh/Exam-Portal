import 'package:flutter/material.dart';
import 'app_route.dart';
import 'homepage.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:provider/provider.dart';
import 'view_models/exam_view_model.dart';


void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ExamViewModel()),
      ],
      child: MyApp(),
    ),
  );
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
