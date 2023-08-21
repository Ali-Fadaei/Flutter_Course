import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_gorouter/modules/search/cubit/search_cubit.dart';
import 'package:shop_app_gorouter/ui_kit/ui_kit.dart' as U;

class SearchFilterBtms extends StatelessWidget {
//
  static Future show(
    BuildContext context, {
    required SearchCubit searchCubit,
  }) async {
    U.BottomSheet.show(
      context,
      maxHeight: 500,
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
              U.Text(
                'بر اساس امتیاز: ',
                size: U.TextSize.xl,
                weight: U.TextWeight.medium,
              ),
              Spacer()
            ],
          ),
          Row(
            children: [
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  return Expanded(
                    child: U.RangeSlider(
                      minValue: 0,
                      maxValue: 5,
                      divisions: 10,
                      minRangeValue: state.minRating,
                      maxRangeValue: state.maxRating,
                      sign: const Icon(Icons.star, color: Colors.amber),
                      onChanged: searchCubit.onRatingSliderChanged,
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 25),
          const Row(
            children: [
              U.Text(
                'بر اساس قیمت: ',
                size: U.TextSize.xl,
                weight: U.TextWeight.medium,
              ),
              Spacer()
            ],
          ),
          Row(
            children: [
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  return Expanded(
                    child: U.RangeSlider(
                      showType: U.RangeSliderShowType.int,
                      minValue: 0,
                      maxValue: 500000000,
                      divisions: 500,
                      minRangeValue: state.minPrice.toDouble(),
                      maxRangeValue: state.maxPrice.toDouble(),
                      sign: const U.Text('تومان'),
                      onChanged: searchCubit.onPriceSliderChanged,
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 25),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              return Row(
                children: [
                  const U.Text(
                    'در دسته‌بندی های: ',
                    size: U.TextSize.xl,
                    weight: U.TextWeight.medium,
                  ),
                  ...state.categories
                      .expand((element) => [
                            const Spacer(),
                            U.CheckBox(
                              title: element.title,
                              isChecked: state.selectedCategories.any(
                                (e) => element.id == e.id,
                              ),
                              onPressed: (checked) =>
                                  searchCubit.onCategoriesChecked(
                                checked,
                                element,
                              ),
                            ),
                            if (state.categories.last != element)
                              const Spacer(),
                          ])
                      .toList(),
                ],
              );
            },
          ),
          const SizedBox(height: 25),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              return Row(
                children: [
                  const U.Text(
                    'به ترتیب: ',
                    size: U.TextSize.xl,
                    weight: U.TextWeight.medium,
                  ),
                  const Spacer(),
                  U.RadioButton<int>(
                    groupValue: state.sortId,
                    value: 1,
                    title: 'قیمت',
                    onPressed: searchCubit.onSortIdChanged,
                  ),
                  const Spacer(),
                  U.RadioButton<int>(
                    groupValue: state.sortId,
                    value: 2,
                    title: 'امتیاز',
                    onPressed: searchCubit.onSortIdChanged,
                  ),
                  const Spacer(),
                  const SizedBox(height: 25, child: U.Divider.vertical()),
                  const Spacer(),
                  U.RadioButton<int>(
                    groupValue: state.orderId,
                    value: 1,
                    title: 'صعودی',
                    onPressed: searchCubit.onOrderIdChanged,
                  ),
                  const Spacer(),
                  U.RadioButton<int>(
                    groupValue: state.orderId,
                    value: 2,
                    title: 'نزولی',
                    onPressed: searchCubit.onOrderIdChanged,
                  ),
                  const Spacer(),
                ],
              );
            },
          ),
          const Spacer(),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              return U.Button(
                loading: state.loading,
                title: 'اعمال فیلتر',
                onPressed: () {
                  searchCubit
                      .onFilterApplyPressed()
                      .then((value) => Navigator.of(context).pop());
                },
              );
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
