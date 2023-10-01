import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'ui_kit.dart' as U;

class Banner extends StatelessWidget {
//
  final bool loading;

  final double ratio;

  final List<BannerItem> items;

  const Banner({
    super.key,
    this.loading = false,
    this.ratio = 35 / 9,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: items
          .map(
            (e) => InkWell(
              onTap: e.onTap,
              child: U.Image(path: e.img),
            ),
          )
          .toList(),
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: ratio,
      ),
    );
  }
}

class BannerItem {
  //
  final String img;

  final void Function()? onTap;

  const BannerItem({
    required this.img,
    this.onTap,
  });
}
