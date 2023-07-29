import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/domains/store_repository/store_repository.dart';

class CategoriesPage extends StatelessWidget {
//
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var storeRepository = RepositoryProvider.of<StoreRepository>(context);
    return Center(
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        children: storeRepository.categories
            .expand(
              (element) => [
                Container(
                  margin: EdgeInsets.all(20),
                  width: 250.50,
                  height: 250.11,
                  decoration: ShapeDecoration(
                    color: element.color,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.50, color: element.color),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x00000000),
                        blurRadius: 12,
                        offset: Offset(0, 6),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: Image.asset(
                          element.image,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text(
                        element.title,
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 16,
                          fontFamily: 'IRANSans',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.10,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
            .toList(),
      ),
    );
  }
}
