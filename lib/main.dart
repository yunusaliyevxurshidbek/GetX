import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sm/config/root_binding.dart';
import 'package:getx_sm/pages/home_page.dart';
import 'package:getx_sm/pages/splash_page.dart';
import 'package:getx_sm/services/di_service.dart';

void main() async{
  DIService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
      initialBinding: RootBinding(),
    );
  }
}

