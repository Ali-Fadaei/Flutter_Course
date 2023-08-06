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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          leftSection ??
              IconButton(
                onPressed: () {},
                icon: const U.Image(path: U.Images.menuIcon),
              ),
          const Spacer(),
          title == null
              ? const U.Image(path: U.Images.shopLogo)
              : U.Text(
                  title!,
                  font: U.TextFont.ghasem,
                  size: U.TextSize.xl,
                  weight: U.TextWeight.bold,
                ),
          const Spacer(),
          rightSection ??
              IconButton(
                onPressed: () {},
                icon: const U.Image(path: U.Images.notifIcon),
              ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
