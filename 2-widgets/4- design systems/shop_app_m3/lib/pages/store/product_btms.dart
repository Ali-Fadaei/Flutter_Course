import 'package:flutter/material.dart';
import 'package:shop_app_m3/models/product.dart';

class ProductBottomSheet extends StatelessWidget {
//
  static show(BuildContext context, Product product) {
    var colorScheme = ColorScheme.fromSeed(seedColor: product.category.color);
    showBottomSheet(
      backgroundColor: colorScheme.surfaceVariant,
      context: context,
      builder: (context) {
        return ProductBottomSheet(product: product);
      },
    );
  }

  final Product product;

  const ProductBottomSheet({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var colorCheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(11.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 5,
                width: 60,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colorCheme.outline,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              SizedBox(
                height: 400,
                child: Image.asset(
                  product.image,
                  fit: BoxFit.contain,
                ),
              ),
              
              /// Product Details
               SizedBox(
                    height: 25,
                  ),
              
              Column(
                children: [
                  /// Name and Category ,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.title ,style: TextStyle(
                           
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),),
                          Text(product.category.title )
                        ],
                      ),
                      Container(
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_border_outlined)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
              
                  /// Counter and Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [Text(" - ",style: TextStyle(
                           
                            fontSize: 20,
                            
                          ),), Text(" 0 ",style: TextStyle(
                           
                            fontSize: 20,
                            
                          ),), Text(" + ",style: TextStyle(
                           
                            fontSize: 20,
                            
                          ),)],
                      ),
                      Container(
                        child: Text("${product.price.toString()} تومان",style: TextStyle(
                           
                            fontSize: 20,
                            
                          ),),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
              
                  /// Product Details
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Product Details",style: TextStyle(
                           
                            fontSize: 19,
                            fontWeight: FontWeight.bold
                          ),),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.keyboard_arrow_down_rounded))
                        ],
                      ),
                      Text(product.description)
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
              
                  /// Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Rates",style: TextStyle(
                           
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),), Text("${product.rating} from 5",style: TextStyle(
                           
                            fontSize: 20,
                          ),)],
                  ),
                  SizedBox(
                    height: 25,
                  ),
              
                  /// Add to Cart
                  SizedBox(
                      child: GestureDetector(
                    child: Container(
                      width: 300,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red,
                      ),
                      child: Center(
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )),
                  SizedBox(
                    height: 15,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
