import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:simollu_front/root.dart';

List<Map<String, String>> icons = [
  {
    "icon": "assets/home.svg",
    "label": "home",
  },
  {
    "icon": "assets/search.svg",
    "label": "search",
  },
  {
    "icon": "assets/person.svg",
    "label": "person",
  },
  {
    "icon": "assets/more.svg",
    "label": "more",
  }
];

class NavBar extends StatelessWidget {
  final RootController controller;
  const NavBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: controller.rootPageIndex.value,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: controller.changeRootPageIndex,
        items: [
          ...List.generate(
            icons.length,
            (index) => BottomNavigationBarItem(
              icon: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedContainer(
                    height:
                        controller.rootPageIndex.value == index ? 50.0 : 0.0,
                    width: controller.rootPageIndex.value == index ? 50.0 : 0.0,
                    duration: Duration(milliseconds: 300),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: controller.rootPageIndex.value == index
                          ? Color(0xFFFFD200)
                          : null,
                    ),
                    curve: Curves.fastOutSlowIn,
                  ),
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: SvgPicture.asset(
                      colorFilter: controller.rootPageIndex.value == index
                          ? ColorFilter.mode(Colors.white, BlendMode.srcIn)
                          : null,
                      icons[index]["icon"] as String,
                    ),
                  )
                ],
              ),
              label: icons[index]["label"]!,
            ),
          )
        ]);
  }
}