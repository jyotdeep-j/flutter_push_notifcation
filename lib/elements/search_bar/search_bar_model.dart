import '/elements/search_field/search_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_bar_widget.dart' show SearchBarWidget;
import 'package:flutter/material.dart';

class SearchBarModel extends FlutterFlowModel<SearchBarWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for SearchField component.
  late SearchFieldModel searchFieldModel;

  @override
  void initState(BuildContext context) {
    searchFieldModel = createModel(context, () => SearchFieldModel());
  }

  @override
  void dispose() {
    searchFieldModel.dispose();
  }
}
