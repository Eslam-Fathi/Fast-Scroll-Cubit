import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Data_model/data_nofilter.dart';
import '../Fast_filter/fast_filter_bar_state.dart';

abstract class FilterBarEvent {}

class ApplyFilterEvent extends FilterBarEvent {
  final String selectedFilter;

  ApplyFilterEvent(this.selectedFilter);
}

class FilterBarCubit extends Cubit<FilterBarState> {
  final List<Data> originalData;
  String selectedOption = 'All';
  bool showAllOptions = true;

  FilterBarCubit(this.originalData)
      : super(FilterBarState(
            filterOptions:
                ['All'] + originalData.map((e) => e.category).toSet().toList(),
            selectedFilter: 'All',
            filteredData: originalData));

  void applyFilter(String selectedFilter) {
    List<Data> filteredData = (selectedFilter == 'All')
        ? originalData
        : originalData
            .where((element) => element.category == selectedFilter)
            .toList();
    selectedOption = selectedFilter;
    showAllOptions = false;
    emit(state.copyWith(
        selectedFilter: selectedFilter,
        filteredData: filteredData,
        filterOptions:
            ['All'] + originalData.map((e) => e.category).toSet().toList()));
  }

  void resetFilter() {
    selectedOption = 'All';
    showAllOptions = true;
    emit(state.copyWith(
        selectedFilter: 'All',
        filteredData: originalData,
        filterOptions:
            ['All'] + originalData.map((e) => e.category).toSet().toList()));
  }

  List<String> getFilterOptions() {
    if (showAllOptions) {
      return ['All'] + originalData.map((e) => e.category).toSet().toList();
    } else {
      List<String> filterOptions = ['All', selectedOption];
      for (String option
          in originalData.map((e) => e.category).toSet().toList()) {
        if (option != selectedOption) {
          filterOptions.add(option);
        }
      }
      return filterOptions;
    }
  }
}
