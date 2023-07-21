import 'package:flutter/material.dart';
import 'Data/Cubit/Fast_filter/fast_filter_bar_cubit.dart';
import 'Data/Data_model/data_nofilter.dart';
import 'filter_bar.dart';

void main() {
  runApp(FilterBar());
}

class FilterBar extends StatelessWidget {
  final FilterBarCubit filterBarCubit = FilterBarCubit(data);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FastFilterBar(filterBarCubit: filterBarCubit),
      ),
    );
  }
}
