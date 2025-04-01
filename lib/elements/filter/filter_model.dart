import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filter_widget.dart' show FilterWidget;
import 'package:flutter/material.dart';

class FilterModel extends FlutterFlowModel<FilterWidget> {
  ///  Local state fields for this component.

  List<String> selectedFilters = [];
  void addToSelectedFilters(String item) => selectedFilters.add(item);
  void removeFromSelectedFilters(String item) => selectedFilters.remove(item);
  void removeAtIndexFromSelectedFilters(int index) =>
      selectedFilters.removeAt(index);
  void insertAtIndexInSelectedFilters(int index, String item) =>
      selectedFilters.insert(index, item);
  void updateSelectedFiltersAtIndex(int index, Function(String) updateFn) =>
      selectedFilters[index] = updateFn(selectedFilters[index]);

  List<ItemsRecord> filteredItems = [];
  void addToFilteredItems(ItemsRecord item) => filteredItems.add(item);
  void removeFromFilteredItems(ItemsRecord item) => filteredItems.remove(item);
  void removeAtIndexFromFilteredItems(int index) =>
      filteredItems.removeAt(index);
  void insertAtIndexInFilteredItems(int index, ItemsRecord item) =>
      filteredItems.insert(index, item);
  void updateFilteredItemsAtIndex(int index, Function(ItemsRecord) updateFn) =>
      filteredItems[index] = updateFn(filteredItems[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for CategoryDropdown widget.
  String? categoryDropdownValue;
  FormFieldController<String>? categoryDropdownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in CategoryDropdown widget.
  CategoriesRecord? category;
  // State field(s) for PriceDropDown widget.
  String? priceDropDownValue;
  FormFieldController<String>? priceDropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
