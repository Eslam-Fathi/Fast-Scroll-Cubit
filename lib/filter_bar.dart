import 'package:flutter/material.dart';
import 'Data/Cubit/Fast_filter/fast_filter_bar_cubit.dart';
import 'Data/Cubit/Fast_filter/fast_filter_bar_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class FastFilterBar extends StatelessWidget {
  final FilterBarCubit filterBarCubit;

  FastFilterBar({required this.filterBarCubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBarCubit, FilterBarState>(
      bloc: filterBarCubit,
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.filterOptions.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ChoiceChip(
                      label: Text(state.filterOptions[index]),
                      selected:
                          state.selectedFilter == state.filterOptions[index],
                      selectedColor: Colors.red,
                      onSelected: (selected) {
                        if (selected) {
                          filterBarCubit
                              .applyFilter(state.filterOptions[index]);
                        }
                      },
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: state.filteredData.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final item = state.filteredData[index];
                  return ListTile(
                    title: Text(item.title),
                    subtitle: Text(item.description),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
