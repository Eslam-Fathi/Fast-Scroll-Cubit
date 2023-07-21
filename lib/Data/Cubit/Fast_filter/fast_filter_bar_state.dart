import '../../Data_model/data_nofilter.dart';

class FilterBarState {
  final List<String> filterOptions;
  final String selectedFilter;
  final List<Data> filteredData;

  FilterBarState({
    required this.filterOptions,
    required this.selectedFilter,
    required this.filteredData,
  });

  FilterBarState copyWith({
    List<String>? filterOptions,
    String? selectedFilter,
    List<Data>? filteredData,
  }) {
    return FilterBarState(
      filterOptions: filterOptions ?? this.filterOptions,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      filteredData: filteredData ?? this.filteredData,
    );
  }
}
