// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_gorouter/ui_kit/ui_kit.dart' as U;

class CheckOutPage extends StatelessWidget {
//

  static const route = 'checkout';

  const CheckOutPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: U.AppBar.secondary(
        title: "تکمیل خرید ",
        onBackPressed: () {},
      ),
      body: Container(
        color: U.Theme.background,
        child: ListView(
          padding: const EdgeInsets.all(12.0),
          children: [
            U.Card(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    children: [
                      U.Image(
                        path: U.Images.orderIcon,
                        size: 24,
                        color: U.Theme.primary,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      U.Text(
                        "سبد خرید",
                        size: U.TextSize.xl,
                        weight: U.TextWeight.medium,
                      )
                    ],
                  ),
                  U.Divider.horizontal(
                    space: 12,
                    color: U.Theme.secondary,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            U.Image(
                              path: 'assets/imgs/products/s23_ultra.png',
                              size: 60,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  U.Text(
                                    "salam",
                                  ),
                                  Row(
                                    children: [
                                      U.Text("gimmaat"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      U.Text(
                                        "*",
                                        color: U.Theme.primary,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      U.Text(
                                        "tedad",
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            U.Text("total price"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  U.Divider.horizontal(
                    color: U.Theme.secondary,
                    space: 5,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const U.Card()
          ],
        ),
      ),
    );
  }
}

class _CheckOutItem extends StatelessWidget {
  //

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
