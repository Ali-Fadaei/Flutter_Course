import 'package:flutter/material.dart';
import './ui_kit.dart' as U;

class SearchInput extends StatefulWidget {
//
  final String? hintText;
  final TextEditingController controller;
  final void Function(String text) onSearch;

  const SearchInput({
    super.key,
    this.hintText = 'جستجو',
    required this.controller,
    required this.onSearch,
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
//
  late bool textIsEmpty;

  @override
  void initState() {
    textIsEmpty = widget.controller.text.isEmpty;
    widget.controller.addListener(() {
      setState(
        () => textIsEmpty = widget.controller.text.isEmpty,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return U.Card(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => widget.onSearch(widget.controller.text),
            child: const U.Image(path: U.Images.searchIcon),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: widget.controller,
              onEditingComplete: () => widget.onSearch(widget.controller.text),
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
          if (!textIsEmpty) ...[
            const SizedBox(width: 4),
            GestureDetector(
              onTap: () => widget.controller.clear(),
              child: const U.Image(path: U.Images.removeIcon),
            ),
          ],
        ],
      ),
    );
  }
}
