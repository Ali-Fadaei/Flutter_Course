import 'package:flutter/material.dart';
import 'ui_kit.dart' as U;

class NavigationBar extends StatelessWidget {
  ///
  final int selectedIndex;

  final List<NavigationBarDestination> destinations;

  final void Function(int selectedIndex) onDestnationChange;

  const NavigationBar({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestnationChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: const BoxDecoration(
        color: U.Theme.surface,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(U.Theme.radius),
        ),
        boxShadow: [
          BoxShadow(
            color: U.Theme.secondary,
            blurRadius: 20,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          ...destinations.expand(
            (element) => [
              _NavigationBarDestination(
                title: element.title,
                icon: element.icon,
                isSelected: element == destinations[selectedIndex],
                badgeCount: element.badgeCount,
                onPressed: () => onDestnationChange(
                  destinations.indexOf(element),
                ),
              ),
              if (destinations.last != element) const Spacer(),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class NavigationBarDestination {
//
  final String title;

  final String icon;

  // final String route;

  final int? badgeCount;

  const NavigationBarDestination({
    required this.title,
    required this.icon,
    // required this.route,
    this.badgeCount,
  });
}

class _NavigationBarDestination extends StatelessWidget {
//
  final String title;

  final String icon;

  final bool isSelected;

  final int? badgeCount;

  final void Function() onPressed;

  const _NavigationBarDestination({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onPressed,
    this.badgeCount,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(U.Theme.radius),
      child: InkWell(
        borderRadius: BorderRadius.circular(U.Theme.radius),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: U.Badge(
            count: badgeCount,
            color: isSelected ? U.BadgeColor.secondary : U.BadgeColor.primary,
            child: Column(
              children: [
                U.Image(
                  path: icon,
                  size: 24,
                  color: isSelected ? U.Theme.primary : U.Theme.secondary,
                ),
                const Spacer(),
                U.Text(
                  title,
                  size: U.TextSize.sm,
                  color: isSelected ? U.Theme.primary : U.Theme.secondary,
                  weight: isSelected ? U.TextWeight.bold : U.TextWeight.medium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
