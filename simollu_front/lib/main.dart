import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simollu_front/views/liking_things.dart';

import 'package:simollu_front/root.dart';
import './views/my_page.dart';
import 'widgets/nav_bar.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.cupertino,
      initialBinding: BindingsBuilder(() {
        Get.put(RootController());
      }),
      home: Root(),
    );
  }
}
