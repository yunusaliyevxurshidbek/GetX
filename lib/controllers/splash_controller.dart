import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/http_service.dart';
import '../services/log_service.dart';

class SplashController extends GetxController{
  var isLoading = false.obs;
  var userList = [].obs;

  ScrollController scrollController = ScrollController();
  int currentPage = 1;

  initScrollListener(){
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent <= scrollController.offset) {
        currentPage++;
        LogService.i(currentPage.toString());
        loadRandomUserList();
      }
    });
  }

  loadRandomUserList() async {
    isLoading.value = true;


    var response = await Network.GET(Network.API_RANDOM_USER_LIST, Network.paramsRandomUserList(currentPage));
    var randomUserListRes = Network.parseRandomUserList(response!);
    var results = randomUserListRes.results;

    userList.addAll(results);
    isLoading.value = false;
  }


}