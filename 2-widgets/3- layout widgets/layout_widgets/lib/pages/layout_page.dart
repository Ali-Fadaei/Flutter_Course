import 'package:flutter/material.dart';
import 'package:layout_widgets/pages/expanded_column_page.dart';
import 'package:layout_widgets/pages/expanded_row_page.dart';
import 'package:layout_widgets/pages/stack_page.dart';

class LayoutPage extends StatelessWidget {
//
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(child: ExpandedRowPage()),
          Expanded(child: ExpandedColumnPage()),
          Expanded(child: StackPage()),
        ],
      ),
    );
  }
}
