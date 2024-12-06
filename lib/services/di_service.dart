
import 'package:get/get.dart';
import 'package:getx_sm/controllers/main_controller.dart';
import 'package:getx_sm/controllers/splash_controller.dart';

class DIService {

  static Future<void> init() async{
    Get.lazyPut<MainController>(() => MainController(),fenix:  true);
    Get.lazyPut<SplashController>(() => SplashController(),fenix: true);
  }
}