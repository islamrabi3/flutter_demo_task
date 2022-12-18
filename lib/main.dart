import 'package:flutter/material.dart';
import 'package:flutter_demo_app_task/core/shared/cache_helper.dart';
import 'package:flutter_demo_app_task/core/shared/dio_helper.dart';

import 'package:flutter_demo_app_task/view/home_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.dioInit();
  await CacheHelper.intit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
