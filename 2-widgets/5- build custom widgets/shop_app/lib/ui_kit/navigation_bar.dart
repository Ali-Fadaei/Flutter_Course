import 'package:flutter/material.dart';
import 'ui_kit.dart' as U;

class NavigationBar extends StatelessWidget {
//
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
      height: 55,
      decoration: BoxDecoration(
        color: U.Theme.surface,
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(U.Theme.radius)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Spacer(),
          ...destinations.expand(
            (element) => [
              _NavigationBarDestination(
                title: element.title,
                icon: element.icon,
                isSelected: element == destinations[selectedIndex],
                onPressed: () => onDestnationChange(
                  destinations.indexOf(element),
                ),
              ),
              if (destinations.last != element) Spacer(),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}

class NavigationBarDestination {
//
  final String title;

  final String icon;

  const NavigationBarDestination({
    required this.title,
    required this.icon,
  });
}

class _NavigationBarDestination extends StatelessWidget {
//
  final String title;

  final String icon;

  final bool isSelected;

  final void Function() onPressed;

  const _NavigationBarDestination({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Material(
        borderRadius: BorderRadius.circular(U.Theme.radius),
        child: InkWell(
          borderRadius: BorderRadius.circular(U.Theme.radius),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                U.Image(
                  path: icon,
                  color: isSelected ? U.Theme.primary : U.Theme.secondary,
                ),
                SizedBox(height: 4),
                U.Text(
                  title,
                  size: U.TextSize.md,
                  color: isSelected ? U.Theme.primary : U.Theme.secondary,
                  weight: isSelected ? U.TextWeight.bold : U.TextWeight.normal,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
