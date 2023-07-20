import 'package:flutter/material.dart';
import 'ui_kit.dart' as U;

class NavigationBar extends StatelessWidget {
//

  const NavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: U.Theme.surface,
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(U.Theme.radius)),
      ),
      child: Row(
        children: [],
      ),
    );
  }
}

class NavigationBarDestination extends StatelessWidget {
//
  final String title;

  final String icon;

  final bool isSelected;

  final void Function() onPressed;

  const NavigationBarDestination({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(U.Theme.radius),
      child: InkWell(
        borderRadius: BorderRadius.circular(U.Theme.radius),
        child: Column(
          children: [
            U.Image(
              path: icon,
              color: isSelected ? U.Theme.primary : U.Theme.secondary,
            ),
            SizedBox(height: 8),
            U.Text(
              title,
              size: U.TextSize.lg,
              weight: isSelected ? U.TextWeight.bold : U.TextWeight.normal,
            ),
          ],
        ),
      ),
    );
  }
}
