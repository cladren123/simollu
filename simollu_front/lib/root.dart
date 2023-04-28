import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:simollu_front/views/liking_things_page.dart';
import 'package:simollu_front/views/my_page.dart';
import 'package:simollu_front/views/tmp_page.dart';
import 'package:simollu_front/widgets/nav_bar.dart';

class RootController extends GetxController {
  RxInt rootPageIndex = 0.obs;

  void changeRootPageIndex(int index) {
    rootPageIndex(index);
  }
}

class Root extends GetView<RootController> {
  Root({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return !await navigatorKey.currentState!.maybePop();
      },
      child: Obx(
        () => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Test'),
          ),
          body: IndexedStack(
            index: controller.rootPageIndex.value,
            children: [
              Navigator(
                key: navigatorKey,
                onGenerateRoute: (routeSettings) {
                  return MaterialPageRoute(builder: (context) => const TmpPage());
                },
              ),
              LikingThings(),
              MyPage(),
            ],
          ),
          bottomNavigationBar: NavBar(
            controller: controller,
          ),
        ),
      ),
    );
  }
}