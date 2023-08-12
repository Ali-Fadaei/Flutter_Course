import 'package:flutter/material.dart';
import './ui_kit.dart' as U;

class AppBar extends StatelessWidget implements PreferredSizeWidget {
  ///
  final bool isPrimary;

  final String? title;

  final Widget? action;

  final void Function()? onMenuPressed;

  final void Function()? onNotifPressed;

  final void Function()? onBackPressed;

  const AppBar.primary({
    super.key,
    required this.onMenuPressed,
    required this.onNotifPressed,
  })  : isPrimary = true,
        onBackPressed = null,
        action = null,
        title = null;

  const AppBar.secondary({
    super.key,
    required this.title,
    required this.onBackPressed,
    this.action,
  })  : isPrimary = false,
        onMenuPressed = null,
        onNotifPressed = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: U.Theme.background,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        textDirection: TextDirection.ltr,
        children: [
          isPrimary
              ? IconButton(
                  onPressed: onMenuPressed,
                  icon: const U.Image(path: U.Images.menuIcon),
                )
              : IconButton(
                  onPressed: onBackPressed,
                  icon: const U.Image(path: U.Images.arrowLeftIcon),
                ),
          const Spacer(),
          title == null
              ? const U.Image(path: U.Images.shopLogo)
              : U.Text(
                  title!,
                  font: U.TextFont.ghasem,
                  size: U.TextSize.xxxl,
                  weight: U.TextWeight.regular,
                ),
          const Spacer(),
          isPrimary
              ? IconButton(
                  onPressed: onNotifPressed,
                  icon: const U.Image(path: U.Images.notifIcon),
                )
              : action ?? const SizedBox()
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
