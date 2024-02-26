import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeController extends GetxController with StateMixin<RxBool> {
  RxString errorText = ''.obs;
  RxBool isRegister = true.obs, isLoading = true.obs;
  RxInt bottomAppBarIndex = 0.obs, selectedItem = 0.obs;
  TextEditingController accessTokenController = TextEditingController();

  late PersistentTabController persistentController =
      PersistentTabController(initialIndex: 0);

  TextEditingController tittleSearchController = TextEditingController();
//Create a new AndroidNotificationChannel instance:

  @override
  void onInit() async {}

  @override
  void onReady() async {
//Create the channel on the device (if a channel with an id already exists, it will be updated):
  }

  @override
  void onClose() {}
}
