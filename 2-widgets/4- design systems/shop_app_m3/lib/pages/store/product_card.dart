import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
//
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.network(
                'https://dkstatics-public.digikala.com/digikala-products/b2c0eb53f0eeacdefb8771155bf5e4887222a654_1688388473.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/quality,q_90',
              ),
              SizedBox(height: 15),
              Text('product name', textAlign: TextAlign.right),
              SizedBox(height: 5),
              Text('rating', textAlign: TextAlign.right),
              SizedBox(height: 20),
              Row(
                children: [
                  FloatingActionButton(
                    onPressed: () {},
                    elevation: 2,
                    mini: true,
                    child: Icon(Icons.add),
                  ),
                  Spacer(),
                  Text(
                    '42,000,000 تومان',
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
