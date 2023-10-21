import 'package:flutter/material.dart';
import './ui_kit.dart' as U;

class TextInput extends StatefulWidget {
  ///
  final String title;

  final String? hintText;

  final bool isRequired;

  final bool autoFocus;

  final bool disabled;

  final TextEditingController controller;

  final void Function(String text)? onEditingCompleted;

  const TextInput({
    super.key,
    this.title = 'emptyTitle',
    this.hintText,
    this.isRequired = false,
    this.autoFocus = false,
    this.disabled = false,
    this.onEditingCompleted,
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
    return Opacity(
      opacity: widget.disabled ? 0.6 : 1,
      child: InkWell(
        canRequestFocus: false,
        borderRadius: BorderRadius.circular(U.Theme.radius),
        onTap: () => !hasFocus ? focusNode.requestFocus() : null,
        child: U.Card(
          height: 45,
          borderColor: hasFocus ? U.Theme.primary : null,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  textAlign: TextAlign.start,
                  enabled: !widget.disabled,
                  focusNode: focusNode,
                  autofocus: widget.autoFocus,
                  controller: widget.controller,
                  onTapOutside: (_) => focusNode.unfocus(),
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
                    isDense: true,
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
      ),
    );
  }
}
