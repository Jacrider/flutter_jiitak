import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  List<PersistentBottomNavBarItem> navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: "Search",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.work),
        title: "Work",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.scanner,
          color: Colors.white,
        ),
        title: "scan",
        activeColorPrimary: Colors.amber,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.chat),
        title: "Chat",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: "Profile",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  List<Widget> screens() {
    return [
      const Test(),
      const Test(),
      const Test(),
      const Test(),
      const Test()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller.persistentController,
      screens: screens(),
      items: navBarItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,

      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }
}

class Test extends GetView<HomeController> {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white70,
          automaticallyImplyLeading: false,
          title: Container(
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey.shade200,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                controller: controller.tittleSearchController,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.black38),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          centerTitle: false,
          actions: const [
            Icon(
              Icons.filter,
              color: Colors.black45,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.health_and_safety,
              color: Colors.red,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            child: const Icon(
              Icons.location_on,
              size: 30,
              color: Colors.black,
            ),
            onPressed: () {
              Get.snackbar("Alert", 'Floating action button pressed',backgroundColor: Colors.blueGrey);
            }),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              width: Get.width,
              color: Colors.amber,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Jacrider, welcome\'s you',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              constraints: const BoxConstraints(minHeight: 10, maxHeight: 70),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    child: Obx(
                      () => ChoiceChip(
                        selected: controller.selectedItem.value == index,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.transparent,
                        selectedColor: Colors.amber,
                        padding: const EdgeInsets.all(4),
                        onSelected: (value) {
                          controller.selectedItem.value = value ? index : -1;
                        },
                        label: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [Text('%#%'), Text('12')],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        constraints: const BoxConstraints(minHeight: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    'https://images.pexels.com/photos/16188539/pexels-photo-16188539/free-photo-of-flowers-for-sale-at-a-market.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
                                    fit: BoxFit.fill,
                                    height: Get.height / 4,
                                    width: double.infinity,
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: -7,
                                  child: Container(
                                    color: Colors.red,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 20),
                                    child: const Text(
                                      "data",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10),
                              child: Text(
                                  "sdfhf dfgdfhfgh dgdfhfghfgs dffgdfgdfghcvdfgdf dgdfgdfg"),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 0,
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      color: Colors.red.shade50,
                                      child: const Text(
                                          "sdfhf dfgdfhfgh dgdfhfghfgs"),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(" ¥ 2500"),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                              child: Text("sdfhf (27-25)  "),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                              child: Text("sdfhf dfgdfhfgh dgdfh"),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                              child: Text("sdfhf dfgdfhfgh dgdfh"),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Expanded(
                                    flex: 0,
                                    child: Text(
                                      "sdfhf dfgdfhfgh dgdfhfghfgs",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.heart_broken),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
