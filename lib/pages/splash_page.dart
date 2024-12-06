import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sm/controllers/splash_controller.dart';

import '../views/item_random_user.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  @override
  void initState() {
    super.initState();
    Get.find<SplashController>().initScrollListener();
    Get.find<SplashController>().loadRandomUserList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Method-3"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: GetX<SplashController>(
        init: SplashController(),
        builder: (controller){
          return Stack(
            children: [
              ListView.builder(
                controller:controller.scrollController,
                itemCount:controller.userList.length,
                itemBuilder: (ctx, index) {
                  return itemOfRandomUser(
                    controller.userList[index],index,
                  );
                },
              ),
              controller.isLoading.value
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : const SizedBox.shrink(),
            ],
          );

        },
      ),
    );
  }
}
