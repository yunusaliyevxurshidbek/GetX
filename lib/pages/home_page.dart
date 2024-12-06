import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../views/item_random_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    _controller.loadRandomUserList();
    _controller.initScrollListener();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Method-4"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),

      body: GetBuilder<HomeController>(
        builder: (_){
          return Stack(
            children: [
              ListView.builder(
                controller:_controller.scrollController,
                itemCount:_controller.userList.length,
                itemBuilder: (ctx, index) {
                  return itemOfRandomUser(
                    _controller.userList[index],index,
                  );
                },
              ),
              _controller.isLoading
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : const SizedBox.shrink(),

            ],
          );
        }
      ),
    );
  }
}
