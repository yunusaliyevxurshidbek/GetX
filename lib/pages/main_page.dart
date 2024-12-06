import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sm/controllers/main_controller.dart';

import '../views/item_random_user.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  void initState() {
    super.initState();
    Get.find<MainController>().initScrollListener();
    Get.find<MainController>().loadRandomUserList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Method-1"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Obx(() => Stack(children: [

        ListView.builder(
          controller:Get.find<MainController>().scrollController,
          itemCount:Get.find<MainController>().userList.length,
          itemBuilder: (ctx, index) {
            return itemOfRandomUser(
                Get.find<MainController>().userList[index],index,
            );
          },
        ),

        Get.find<MainController>().isLoading.value
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : const SizedBox.shrink(),


      ],)),
    );
  }
}
