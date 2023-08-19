import 'package:flutter/material.dart';
import './ui_kit.dart' as U;

class SearchInput extends StatefulWidget {
//
  final String? hintText;
  final TextEditingController controller;
  final void Function() onSearch;

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
  ///
  late bool textIsEmpty;

  bool searched = false;

  final focusNode = FocusNode();

  var hasFocused = false;

  @override
  void initState() {
    textIsEmpty = widget.controller.text.isEmpty;
    widget.controller.addListener(() {
      setState(() => textIsEmpty = widget.controller.text.isEmpty);
      if (textIsEmpty && searched) {
        widget.onSearch();
        searched = false;
      }
    });
    focusNode.addListener(() {
      setState(() {
        hasFocused = focusNode.hasFocus;
      });
    });
    super.initState();
  }

  void _onSearch() {
    if (!textIsEmpty) {
      widget.onSearch();
      searched = true;
    }
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
            IconButton(
              onPressed: _onSearch,
              icon: const U.Image(path: U.Images.searchIcon),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: widget.controller,
                onEditingComplete: _onSearch,
                focusNode: focusNode,
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
      ),
    );
  }
}
