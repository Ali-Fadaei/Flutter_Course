import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './ui_kit.dart' as U;

class TextInput extends StatefulWidget {
  ///
  final String title;

  final String? hintText;

  final bool isRequired;

  final TextEditingController controller;

  final List<TextInputFormatter>? formatters;

  final void Function(String text)? onEditingCompleted;

  const TextInput({
    super.key,
    this.title = 'emptyTitle',
    this.hintText,
    this.isRequired = false,
    this.onEditingCompleted,
    this.formatters,
    required this.controller,
  });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  //
  final focusNode = FocusNode();

  bool hasFocus = false;

  @override
  void initState() {
    focusNode.addListener(() {
      setState(() {
        hasFocus = focusNode.hasFocus;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      canRequestFocus: false,
      borderRadius: BorderRadius.circular(U.Theme.radius),
      onTap: () => focusNode.requestFocus(),
      child: U.Card(
        borderColor: hasFocus ? U.Theme.primary : null,
        height: 45,
        child: Row(
          children: [
            const SizedBox(width: 10),
            Stack(
              children: [
                if (widget.isRequired)
                  const Positioned(
                    top: 10,
                    left: 0,
                    child: SizedBox(
                      child: U.Image(
                        path: U.Images.requiredIcon,
                        size: 6,
                      ),
                    ),
                  ),
                Align(
                  alignment: Alignment.center,
                  child: U.Text(
                    '${widget.title}: ',
                    size: U.TextSize.md,
                    weight: U.TextWeight.medium,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 3),
            Expanded(
              child: TextField(
                focusNode: focusNode,
                controller: widget.controller,
                onEditingComplete: widget.onEditingCompleted != null
                    ? () => widget.onEditingCompleted!(widget.controller.text)
                    : null,
                onTapOutside: (_) => focusNode.unfocus(),
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'IranSans',
                  fontWeight: FontWeight.w500,
                  color: U.Theme.secondary,
                ),
                inputFormatters: widget.formatters,
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
