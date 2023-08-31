import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_gorouter/modules/search/cubit/search_cubit.dart';
import 'package:shop_app_gorouter/ui_kit/ui_kit.dart' as U;

class SearchFilterBtms extends StatelessWidget {
//
  static Future<void> show(
    BuildContext context, {
    required SearchCubit searchCubit,
  }) {
    return U.BottomSheet.show(
      context,
      maxHeight: 530,
      builder: (context) {
        return BlocProvider.value(
          value: searchCubit,
          child: const SearchFilterBtms(),
        );
      },
    );
  }

  const SearchFilterBtms({super.key});

  @override
  Widget build(BuildContext context) {
    var searchCubit = BlocProvider.of<SearchCubit>(context);
    return U.BottomSheet(
      child: Column(
        children: [
          const Row(
            children: [
              U.Image(path: U.Images.filterIcon),
              SizedBox(width: 8),
              U.Text(
                'فیلتر جستحو',
                size: U.TextSize.lg,
                weight: U.TextWeight.medium,
              ),
              Spacer(),
            ],
          ),
          const U.Divider.horizontal(),
          const SizedBox(height: 20),
          const Row(
            children: [
              U.Text(
                'بر اساس امتیاز: ',
                weight: U.TextWeight.medium,
              ),
              Spacer(),
            ],
          ),
          BlocBuilder<SearchCubit, SearchState>(
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
                onChanged: searchCubit.onRatingRangeChanged,
              );
            },
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              U.Text(
                'بر اساس قیمت: ',
                weight: U.TextWeight.medium,
              ),
              Spacer(),
            ],
          ),
          BlocBuilder<SearchCubit, SearchState>(
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
                onChanged: searchCubit.onPriceRangeChanged,
              );
            },
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              U.Text(
                'در دسته‌بندی های: ',
                weight: U.TextWeight.medium,
              ),
              Spacer(),
            ],
          ),
          const SizedBox(height: 10),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              return Row(
                children: state.categories
                    .expand(
                      (element) => [
                        const Spacer(),
                        U.CheckBox(
                          title: element.title,
                          isChecked: state.selectedCategories.any(
                            (s) => s.id == element.id,
                          ),
                          onPressed: (checked) => searchCubit
                              .onSelectedCategoryChanged(checked, element),
                        ),
                        if (element == state.categories.last) const Spacer(),
                      ],
                    )
                    .toList(),
              );
            },
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              U.Text(
                'به ترتیب: ',
                weight: U.TextWeight.medium,
              ),
              Spacer(),
            ],
          ),
          const SizedBox(height: 10),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              return Row(
                children: [
                  const Spacer(),
                  U.RadioButton(
                    title: 'قیمت',
                    value: 1,
                    groupValue: state.sort,
                    onPressed: searchCubit.onSortChanged,
                  ),
                  const Spacer(),
                  U.RadioButton(
                    title: 'امتیاز',
                    value: 2,
                    groupValue: state.sort,
                    onPressed: searchCubit.onSortChanged,
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
                    onPressed: searchCubit.onOrderChanged,
                  ),
                  const Spacer(),
                  U.RadioButton(
                    title: 'نزولی',
                    value: 2,
                    groupValue: state.order,
                    onPressed: searchCubit.onOrderChanged,
                  ),
                  const Spacer(),
                ],
              );
            },
          ),
          const Spacer(),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              return SizedBox(
                width: 500,
                child: U.Button(
                  title: 'اعمال فیلتر',
                  loading: state.loading,
                  onPressed: () {
                    searchCubit
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
