import 'package:flutter/material.dart';
import './ui_kit.dart' as U;

class SearchBar extends StatelessWidget {
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final  hintText;
  final TextEditingController inputCtrl;
  const SearchBar({super.key, this.prefixIcon, this.suffixIcon,  required this.hintText, required this.inputCtrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: TextField(
                        controller: inputCtrl,
                        decoration: InputDecoration(
                          filled: true,
                          hintText: hintText,
                          border: OutlineInputBorder(
                            borderRadius:BorderRadius.circular(U.Theme.radius) ,
                            // gapPadding: 100,
                          ),
                        ),
                      ),
    );
  }
}