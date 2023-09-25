import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar(
      {this.appBarTitle,
      this.profileImage,
      this.showBackButton = false,
      this.onBackPressed,
      this.bottom,
      this.elevation,
      super.key});
  final String? profileImage;
  final String? appBarTitle;
  final void Function()? onBackPressed;
  final bool showBackButton;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: AppBar(
      backgroundColor: const Color.fromARGB(255, 30, 54, 91),
      toolbarHeight: 100,
      leading: showBackButton
          ? GestureDetector(
              onTap: onBackPressed ?? () => Get.back(canPop: true),
              child: Icon(
                Icons.arrow_back_rounded,
                weight: 30,
                size: 30,
                color: Theme.of(context).iconTheme.color,
              ))
          : null,
      title: Text(appBarTitle.toString()),
      shadowColor: const Color.fromARGB(255, 106, 104, 104),
      elevation: elevation,
      bottom: bottom,
    ));
  }

  @override
  Size get preferredSize => Size.fromHeight(bottom != null ? 90 : 50);
}
