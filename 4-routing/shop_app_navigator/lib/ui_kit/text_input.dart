import 'package:flutter/material.dart';
import './ui_kit.dart' as U;

class TextInput extends StatefulWidget {
  ///
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
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  //
  final focusNode = FocusNode();

  var hasFocused = false;

  @override
  void initState() {
    focusNode.addListener(() {
      hasFocused = focusNode.hasFocus;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      canRequestFocus: false,
      onTap: () => focusNode.requestFocus(),
      borderRadius: BorderRadius.circular(U.Theme.radius),
      child: U.Card(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        borderColor: hasFocused ? U.Theme.primary : null,
        child: Row(
          children: [
            Stack(
              children: [
                if (widget.isRequired)
                  const Positioned(
                    top: 0,
                    left: 0,
                    child: SizedBox(
                      child: U.Image(path: U.Images.requiredIcon),
                    ),
                  ),
                Align(
                  alignment: Alignment.center,
                  child: U.Text(
                    '${widget.title}: ',
                    font: U.TextFont.bYekan,
                    size: U.TextSize.xl,
                    weight: U.TextWeight.regular,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 5),
            Expanded(
              child: TextField(
                controller: widget.controller,
                onEditingComplete: widget.onEditingCompleted != null
                    ? () => widget.onEditingCompleted!(widget.controller.text)
                    : null,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'IranSans',
                  fontWeight: FontWeight.w500,
                  color: U.Theme.secondary,
                ),
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(
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
      ),
    );
  }
}
