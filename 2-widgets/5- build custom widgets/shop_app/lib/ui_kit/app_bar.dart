import 'package:flutter/material.dart';
import './ui_kit.dart' as U;

class AppBar extends StatelessWidget implements PreferredSizeWidget {
//

  final void Function()? onMenuPressed;

  final void Function()? onNotifPressed;

  final String? title;

  final Widget? leftSection;

  final Widget? rightSection;

  const AppBar.primary({
    super.key,
    required this.onMenuPressed,
    required this.onNotifPressed,
  })  : leftSection = null,
        rightSection = null,
        title = null;

  const AppBar.secondary({
    super.key,
    required this.title,
    required this.leftSection,
    required this.rightSection,
  })  : onMenuPressed = null,
        onNotifPressed = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: U.Theme.background,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          leftSection ??
              IconButton(
                onPressed: () {},
                icon: U.Image(path: U.Images.menuIcon),
              ),
          Spacer(),
          title == null
              ? U.Image(path: U.Images.shopLogo)
              : U.Text(
                  text: title!,
                  size: U.TextSize.xl,
                  weight: U.TextWeight.bold,
                ),
          Spacer(),
          rightSection ??
              IconButton(
                onPressed: () {},
                icon: U.Image(path: U.Images.notifIcon),
              ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120);
}
