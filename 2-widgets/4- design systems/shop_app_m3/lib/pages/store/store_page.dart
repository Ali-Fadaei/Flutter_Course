import 'package:flutter/material.dart';
import 'package:shop_app_m3/models/product.dart';
import 'package:shop_app_m3/pages/store/product_card.dart';

class StorePage extends StatelessWidget {
//
  final List<Product> products;

  const StorePage({
    super.key,
    this.products = const [],
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 25),
    
          /// search bar
    
          TextField(
            enabled: false,
            decoration: InputDecoration(
              filled: true,
              hintText: 'search in store',
              prefixIcon: Padding(
                padding: const EdgeInsetsDirectional.only(start: 12),
                child: Icon(Icons.search, color: Colors.black),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(height: 50),
    
          /// Offer Banner
          Container(
            width: double.infinity,
            height: 120,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [
                  Colors.red.shade200,
                  Colors.yellow.shade400,
                  Colors.blue.shade600,
                ],
              ),
            ),
            child: Text('Promotions Slider'),
          ),
          SizedBox(height: 50),
    
          /// Exclusive Offers
          Row(
            children: [
              Text(
                'Exclusive Offers',
                //todo: make styles
                style: TextStyle(),
              ),
              Spacer(),
              //todo: make styles
              Text(
                'all',
                style: TextStyle(),
              ),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 350,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              
              children: products
                  .expand(
                    (element) => [
                      ProductCard(
                        product: element,
                      ),
                      SizedBox(width: 8),
                    ],
                  )
                  .toList(),
            ),
          ),
          SizedBox(height: 20),
    
          /// Popular Options
          Row(
            children: [
              Text(
                'Popular Options',
                style: TextStyle(),
              ),
              Spacer(),
              Text(
                'all',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 350,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: products
                  .expand(
                    (element) => [
                      ProductCard(
                        product: element,
                      ),
                      SizedBox(width: 8),
                    ],
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
