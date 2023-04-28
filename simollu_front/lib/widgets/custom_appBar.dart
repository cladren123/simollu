import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Widget leading;
  final List<Widget> actions;
  final Border? shape;
  final Color? backgroundColor;
  final double? elevation;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.leading,
    required this.actions,
    this.shape,
    this.backgroundColor,
    this.elevation,
    this.bottom,
  }) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  void _goBack(BuildContext context) {
    Get.back();
  }

  void _showNotificationScreen(BuildContext context) {
    // 알림 화면을 표시하는 코드
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.black
          ),
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => _goBack(context),
        child: widget.leading,
      ),
      actions: [
        GestureDetector(
          onTap: () => _showNotificationScreen(context),
          child: widget.actions[0],
        ),
      ],
      backgroundColor: Colors.white,
      bottom: widget.bottom
    );
  }
}