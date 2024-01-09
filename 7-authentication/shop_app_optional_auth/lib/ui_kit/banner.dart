import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'ui_kit.dart' as U;

class Banner extends StatelessWidget {
//
  final bool loading;

  final double height;

  final List<BannerItem> items;

  const Banner({
    super.key,
    this.loading = false,
    this.height = 180,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: items
          .map(
            (e) => ClipRRect(
              borderRadius: BorderRadius.circular(U.Theme.radius),
              child: InkWell(
                onTap: e.onTap,
                child: U.Image(
                  path: e.img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
          .toList(),
      options: CarouselOptions(
        height: height,
        autoPlay: true,
        enlargeCenterPage: true,
        enlargeFactor: 0.2,
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
