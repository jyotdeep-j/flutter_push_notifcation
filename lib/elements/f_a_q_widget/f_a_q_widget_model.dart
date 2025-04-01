import '/flutter_flow/flutter_flow_util.dart';
import 'f_a_q_widget_widget.dart' show FAQWidgetWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class FAQWidgetModel extends FlutterFlowModel<FAQWidgetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController.dispose();
  }
}
