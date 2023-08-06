import 'package:flutter/material.dart';
import './ui_kit.dart' as U;

class TextInput extends StatelessWidget {
//
  final String title;

  final String? hintText;

  final bool isRequired;

  final TextEditingController controller;

  final void Function(String text)? onEditingCompleted;

  const TextInput({
    super.key,
    this.title = 'emptyTitle',
    this.hintText,
    this.isRequired = false,
    this.onEditingCompleted,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return U.Card(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Stack(
            children: [
              if (isRequired)
                Positioned(
                  top: 0,
                  left: 0,
                  child: SizedBox(
                    child: U.Image(path: U.Images.requiredIcon),
                  ),
                ),
              Align(
                alignment: Alignment.center,
                child: U.Text(
                  '$title: ',
                  font: U.TextFont.bYekan,
                  size: U.TextSize.xl,
                  weight: U.TextWeight.regular,
                ),
              ),
            ],
          ),
          SizedBox(width: 5),
          Expanded(
            child: TextField(
              controller: controller,
              onEditingComplete: onEditingCompleted != null
                  ? () => onEditingCompleted!(controller.text)
                  : null,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'IranSans',
                fontWeight: FontWeight.w500,
                color: U.Theme.secondary,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: 'IranSans',
                  fontWeight: FontWeight.w500,
                  color: U.Theme.outline2,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
