import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_optional_auth/modules/category/cubit/category_cubit.dart';
import 'package:shop_app_optional_auth/ui_kit/text.dart';
import 'package:shop_app_optional_auth/ui_kit/ui_kit.dart' as U;

class CategoryFilterBtms extends StatelessWidget {
//
  static Future<void> show(
    BuildContext context, {
    required CategoryCubit categoryCubit,
  }) {
    return U.BottomSheet.show(
      context,
      maxHeight: 430,
      builder: (context) {
        return BlocProvider.value(
          value: categoryCubit,
          child: const CategoryFilterBtms(),
        );
      },
    );
  }

  const CategoryFilterBtms({super.key});

  @override
  Widget build(BuildContext context) {
    var categoryCubit = BlocProvider.of<CategoryCubit>(context);
    return U.BottomSheet(
      child: Column(
        children: [
          Row(
            children: [
              const U.Image(
                path: U.Images.filterIcon,
                size: 24,
              ),
              const SizedBox(width: 8),
              U.Text(
                'فیلتر محصولات ${categoryCubit.state.category?.title ?? ''}',
                size: TextSize.lg,
                weight: TextWeight.medium,
              ),
              const Spacer(),
            ],
          ),
          const U.Divider.horizontal(),
          const SizedBox(height: 20),
          const Row(
            children: [
              U.Text(
                'بر اساس امتیاز: ',
                weight: TextWeight.medium,
              ),
              Spacer(),
            ],
          ),
          BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              return U.RangeSlider(
                minValue: 0,
                maxValue: 5,
                divisions: 10,
                minRangeValue: state.minRating,
                maxRangeValue: state.maxRating,
                sign: const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onChanged: categoryCubit.onRatingRangeChanged,
              );
            },
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              U.Text(
                'بر اساس قیمت: ',
                weight: TextWeight.medium,
              ),
              Spacer(),
            ],
          ),
          BlocBuilder<CategoryCubit, CategoryState>(
            buildWhen: (previous, current) =>
                previous.maxPrice != current.maxPrice ||
                previous.minPrice != current.minPrice,
            builder: (context, state) {
              return U.RangeSlider(
                minValue: 0,
                maxValue: 500000000,
                divisions: 500,
                minRangeValue: state.minPrice.toDouble(),
                maxRangeValue: state.maxPrice.toDouble(),
                sign: const U.Text(' تومان'),
                showType: U.RangeSliderShowType.int,
                onChanged: categoryCubit.onPriceRangeChanged,
              );
            },
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              U.Text(
                'به ترتیب: ',
                weight: TextWeight.medium,
              ),
              Spacer(),
            ],
          ),
          BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              return Row(
                children: [
                  const Spacer(),
                  U.RadioButton(
                    title: 'قیمت',
                    value: 1,
                    groupValue: state.sort,
                    onPressed: categoryCubit.onSortChanged,
                  ),
                  const Spacer(),
                  U.RadioButton(
                    title: 'امتیاز',
                    value: 2,
                    groupValue: state.sort,
                    onPressed: categoryCubit.onSortChanged,
                  ),
                  const Spacer(),
                  const SizedBox(
                    height: 30,
                    child: U.Divider.vertical(),
                  ),
                  const Spacer(),
                  U.RadioButton(
                    title: 'صعودی',
                    value: 1,
                    groupValue: state.order,
                    onPressed: categoryCubit.onOrderChanged,
                  ),
                  const Spacer(),
                  U.RadioButton(
                    title: 'نزولی',
                    value: 2,
                    groupValue: state.order,
                    onPressed: categoryCubit.onOrderChanged,
                  ),
                  const Spacer(),
                ],
              );
            },
          ),
          const Spacer(),
          BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              return SizedBox(
                width: 500,
                child: U.Button(
                  title: 'اعمال فیلتر',
                  loading: state.loading,
                  onPressed: () {
                    categoryCubit
                        .onFilterApplyPressed()
                        .then((value) => GoRouter.of(context).pop());
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
